};

    long a_fd, m_fd;
    long long accesses, misses;


    /*initializing and starting perf*/
    struct perf_event_attr pe;
    memset(&pe, 0, sizeof(struct perf_event_attr));

    /*group*/
    pe.type = PERF_TYPE_HW_CACHE;
    pe.size = sizeof(struct perf_event_attr);
    pe.config = PERF_COUNT_HW_CACHE_L1D | (PERF_COUNT_HW_CACHE_OP_READ << 8) | (PERF_COUNT_HW_CACHE_RESULT_ACCESS << 16);
    pe.disabled = 1;
    pe.exclude_kernel = 1;
    pe.exclude_hv = 1;
    a_fd = syscall(__NR_perf_event_open, &pe, 0, -1, -1, 0);
    if (a_fd < 0)
        return -1;
    
    /*child*/
    pe.disabled = 0;
    pe.config = PERF_COUNT_HW_CACHE_L1D | (PERF_COUNT_HW_CACHE_OP_READ << 8) | (PERF_COUNT_HW_CACHE_RESULT_MISS << 16);
    m_fd = syscall(__NR_perf_event_open, &pe, 0, -1, a_fd, 0);

    /*enable and start perf*/
    ioctl(a_fd, PERF_EVENT_IOC_RESET, 0);
    ioctl(a_fd, PERF_EVENT_IOC_ENABLE, 0);

    /*start of section - activity to measure*/
	aes_key_setup(key, e_key, 128);
	aes_encrypt(in, out, e_key, 128);
    /*end of section - activity to measure*/

    /*stopping perf*/
    ioctl(a_fd, PERF_EVENT_IOC_DISABLE, 0);
    
    /*reading outputs and printing them*/
    read(m_fd, &misses, sizeof(long long));
    read(a_fd, &accesses, sizeof(long long));
    printf("L1 Cache Accesses: %lld\n", accesses);
    printf("L1 Cache Misses: %lld\n", misses);

    /*cleanup and exit*/
    close(pe_fd);
    return 0;
}
