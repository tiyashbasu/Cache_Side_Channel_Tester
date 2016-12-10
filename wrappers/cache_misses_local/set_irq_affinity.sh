for line in $(cat /proc/interrupts | grep IR-IO-APIC | cut -c-3)
do
	echo 'Setting affinity for interrupt '$line
	echo 'Initial affinity: '$(cat /proc/irq/$line/smp_affinity)
	sh -c "echo $1 > /proc/irq/$line/smp_affinity"
	echo 'Final affinity: '$(cat /proc/irq/$line/smp_affinity)
done
