pid=$(ps -e | grep thesisdev | cut -c-5)

if [ -z $pid ]; then
    rm ./Test-Programs/sim_wrapper/cde-package/cde-root/*.o
    rm ./Test-Programs/sim_wrapper/cde-package/cde-root/src/*.c
    rm -r ./Test-Programs/sim_wrapper/temp/*
    rm -r ./Test-Programs/cache_misses/temp/*
else
    echo "Cannot clean up now since thesisdev is running."
fi
