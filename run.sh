qemu-system-aarch64 -machine raspi3b \
	-cpu cortex-a72 \
	-nographic \
	-dtb bootfs/bcm2710-rpi-3-b.dtb \
	-m 1G \
	-smp 4 \
	-kernel bootfs/kernel8.img \
	-sd 2023-05-03-raspios-bullseye-arm64.img \
	-append "rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootdelay=1" \
	-device usb-net,netdev=net0 \
	-netdev user,id=net0,hostfwd=tcp::2222-:22
	# -s -S

	
