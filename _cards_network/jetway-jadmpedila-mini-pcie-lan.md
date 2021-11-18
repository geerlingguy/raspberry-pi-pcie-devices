---
layout: card
title: "Jetway JADMPEIDLA dual-gigabit Mini PCIe LAN card with Intel i350"
picture: "/images/network-jetway-jadmpedila-mini-pcie-lan.jpeg"
functionality: "Full"
driver_required: "Yes"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/315"
buy_link: https://amzn.to/3Csbp1U
videos: []
---
Alftel shipped me this card with their Seaberry board.

The card has an Intel NHI350AM2 chip on it, and two headers to connect to two 1 Gbps RJ-45 ports externally.

I was able to install the [Intel i350 Linux driver from their website](https://www.intel.com/content/www/us/en/products/details/ethernet/gigabit-controllers/i350-controllers/downloads.html) after applying the following patch:

```patch
diff --git a/src/igb_main.c b/src/igb_main.c
index 75d48c1..d76e536 100644
--- a/src/igb_main.c
+++ b/src/igb_main.c
@@ -29,6 +29,7 @@
 #include <linux/if_bridge.h>
 #include "igb.h"
 #include "igb_vmdq.h"
+#include <linux/ctype.h>
 
 #if defined(DEBUG) || defined(DEBUG_DUMP) || defined(DEBUG_ICR) \
        || defined(DEBUG_ITR)
```

To install the driver:

```
# First, install kernel headers so we can build driver from source.
$ sudo apt install -y raspberrypi-kernel-headers

# Install driver following Intel's README.
$ tar zxf igb-5.8.5.tar.gz
$ cd igb-5.8.5/src/
$ make install

# Load the kernel module.
$ sudo modprobe igb
```

After that's done, you should see two new network interfaces.

There are also drivers in the Linux kernel source, which can be installed by recompiling the kernel with the following option selected in `menuconfig`:

```
Device Drivers
  > Network device support
    > Ethernet driver support
      > Intel devices
```
