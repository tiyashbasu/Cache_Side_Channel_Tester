/*
 * perf_event_open tool to measure the L1DataCacheRead Accesses and Misses
 * using only the userspace.
 */

#include <unistd.h>
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <linux/perf_event.h>
#include <asm/unistd.h>


static long perf_event_open(struct perf_event_attr *hw_event, pid_t pid,
			   int cpu, int group_fd, unsigned long flags) 
{
	int ret;
	ret = syscall(__NR_perf_event_open, hw_event, pid, cpu,
				  group_fd, flags);
	return ret;
}

static int access_fd;
static int miss_fd;

int main(int argc, char **argv)
{
	struct perf_event_attr pe; 
	long long access_count;
	long long miss_count; 

	memset(&pe, 0, sizeof(struct perf_event_attr)); //overwrite the whole struct with 0

	/* ================= ACCESSES ================= */

	pe.type = PERF_TYPE_HW_CACHE; //specifies the overall event type
	pe.size = sizeof(struct perf_event_attr); //size of the perf_event_attr structure

	/*
	* compute config value using the following equation:
	*     (perf_hw_cache_id) | (perf_hw_cache_op_id << 8) | (perf_hw_cache_op_result_id << 16)
	*/
	pe.config = (PERF_COUNT_HW_CACHE_L1D | ( PERF_COUNT_HW_CACHE_OP_READ << 8) | (PERF_COUNT_HW_CACHE_RESULT_ACCESS << 16)); //specifies the event

	pe.disabled = 1; //specifies whether the counter starts out disabled or enabled (later enabled by ioctl)
	pe.exclude_kernel = 1; //excludes events that happen in the kernel space
	pe.exclude_hv = 1; //excludes events that happen in the hypervisor
	pe.exclude_idle = 1;

	//perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu, int group_fd, unsigned long flags)
	//pid == 0 and cpu == -1 -- measures the calling process/thread on any cpu
	//group_fd == -1 -- creates a single event (group with one member)
	access_fd = perf_event_open(&pe, 0, -1, -1, 0); //creates a file descriptor
	if (access_fd == -1) {
	  fprintf(stderr, "Error opening leader %llx\n", pe.config);
	  exit(EXIT_FAILURE);
	}


	/* ================= MISSES ================= */

	/* Use access_fd as the group leader */
	pe.disabled = 0; /* The group leader will start/stop */
	pe.type = PERF_TYPE_HW_CACHE;
	pe.config = (PERF_COUNT_HW_CACHE_L1D | ( PERF_COUNT_HW_CACHE_OP_READ << 8) | (PERF_COUNT_HW_CACHE_RESULT_MISS << 16)); //specifies the event
	miss_fd = perf_event_open(&pe, 0, -1, access_fd, 0);
	if (miss_fd == -1) {
	  fprintf(stderr, "Error opening group event %llx\n", pe.config);
	  exit(EXIT_FAILURE);
	}

	//start measurement  
	//ioctl(fd, PERF_EVENT_IOC_RESET, 0); //resets the event count specified by the file descriptor argument to zero
	//only need to start and stop the group leader */
	ioctl(access_fd, PERF_EVENT_IOC_ENABLE); 

	/* ================= Code to be measured ================= */
	int SIZE = 5000;
	int array[SIZE];
	for (int i = 0; i < SIZE; i++) {
		array[i] = array[i] + 1;
	}
	/* ======================================================= */

	ioctl(access_fd, PERF_EVENT_IOC_DISABLE); //disables the individual counter
	read(access_fd, &access_count, sizeof(long long)); //attempts to read up to sizeof(long long) bytes from the file descriptor into &count
	read(miss_fd, &miss_count, sizeof(long long)); 

	printf("%lld\n", access_count);
	printf("%lld\n", miss_count);

	close(access_fd); //closes the file descriptor
	close(miss_fd);

	return 0;
}
