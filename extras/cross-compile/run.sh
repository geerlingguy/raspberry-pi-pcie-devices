
if [ "$debug" == "" ]; then 

    if [ "$arch" == "" ]; then
        echo "Please set the arch variable to either arm64 or arm32"
        exit 1
    fi
    if [ "$arch" == "arm64" ]; then
        architecture=aarch64-linux-gnu-
    elif [ "$arch" == "arm32" ]; then
        architecture=aarch32-linux-gnu-
    fi
    git clone --depth=1 https://github.com/raspberrypi/linux
    cd linux
    make ARCH=$arch CROSS_COMPILE=$architecture bcm2711_defconfig
    make ARCH=$arch CROSS_COMPILE=$architecture menuconfig
    make -j$(nproc)  ARCH=$arch CROSS_COMPILE=$architecture Image modules dtbs
fi
if [ "$debug" == "true" ]; then 
    bash 
fi