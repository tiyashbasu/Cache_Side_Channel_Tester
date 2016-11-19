pid=$(ps -e | grep thesisdev | cut -c-5)

if [ -z $pid ]; then
    rm ./test_programs/cache_misses_simulator/cde-package/cde-root/*.o
    rm ./test_programs/cache_misses_simulator/cde-package/cde-root/src/*.c
    rm -rf ./test_programs/cache_misses_simulator/temp/*
    rm -rf ./test_programs/cache_misses_local/temp/*
else
    echo "Cannot clean up now since thesisdev is running."
fi
