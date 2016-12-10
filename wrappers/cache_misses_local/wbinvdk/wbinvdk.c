#include <linux/kernel.h>
#include <linux/module.h>
#include <asm/cacheflush.h>
#include <asm/tlbflush.h>
#include <linux/kmod.h>

#define PARAM_LEN 16

int init_module(void)
{   
    printk(KERN_INFO "Clearing L1 cache.\n");

    /*Flush cache*/
    asm("wbinvd");
    flush_cache_all();
//    flush_tlb_all();

    /*execute perf*/
//    system("perf stat -e L1-dcache-loads,L1-dcache-load-misses ./temp/binary.o >> log.txt 2>&1")

    return 0;
}

void cleanup_module(void)
{
    printk(KERN_INFO "Exiting.\n");
}
