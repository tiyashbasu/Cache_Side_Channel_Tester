kill $(ps -e | grep $1 | cut -c-5) > KillProcess.log 2>&1
