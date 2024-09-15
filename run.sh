
# prior to run this script:
# export RASPI_OS_IMAGE=...
if [ -z "$RASPI_OS_IMAGE" ]; then
	echo 'please set RASPI_OS_IMAGE exiting...'
	exit 1
else 
	echo 'running qemu for raspberry pi os...'
fi

qemu-system-aarch64 \
	-machine virt \
	-cpu cortex-a72 \
	-smp 6 \
	-m 4G \
	-kernel Image \
	-append "root=/dev/vda2 rootfstype=ext4 rw panic=0 console=ttyAMA0" \
	-drive format=raw,file=$RASPI_OS_IMAGE,if=none,id=hd0,cache=writeback \
	-device virtio-blk,drive=hd0,bootindex=0 \
    	-netdev user,id=mynet,hostfwd=tcp::2222-:22 \
    	-device virtio-net-pci,netdev=mynet \
     	-monitor telnet:127.0.0.1:5555,server,nowait
