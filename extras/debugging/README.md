# Debugging PCI Express Devices in Linux

This is a general guide for debugging PCIe devices in Linux—specifically for the Raspberry Pi and SBCs, but many of the tools apply to any Linux hardware.

## First steps - `lspci` and `dmesg`

PCI Express devices must be powered correctly, and must have the proper physical interface—be it M.2, PCIe Slot, OCuLink, or the FFC connection on a Pi 5.

Many problems result from a poor PCIe connection or not enough power (either to the slot, or supplemental power for cards like GPUs).

Once you know the physical connection is reliable, the second thing to test is whether _Linux_ sees the PCI Express device.

First, run `lspci` (or for full verbosity, `sudo lspci -vvvv`), and make sure your PCI Express device is listed.

Then, run `dmesg` to view Kernel log output. Look for `pci` log entries, or for entries for whatever driver you assume should be loaded.

You can follow the kernel log while doing things like `sudo modprobe [drivername]` with `dmesg --follow`.

## Debugging an exception in a custom kernel

If you get an 'Oops' / kernel stack trace, you can grab that, and use the `scripts/decode_stacktrace.sh` script included with the Linux kernel source to debug it.

  1. First, make sure your kernel is compiled without kernel module compression, and with the right debugging options enabled:
    a. `Enable loadable module support` > `Module compression mode` set to `None`
    b. `Kernel hacking` > `Compile-time checks and compiler options` > `Debug information` set to `Rely on the toolchain's implicit default DWARF version`
  2. Copy the `dmesg` log from the `Call trace` to the line that says `end trace`, and paste those lines into a file `trace.txt` inside your Linux kernel source directory.
  3. Inside the Linux kernel source directory, run the command: `./scripts/decode_stacktrace.sh /home/pi/linux/vmlinux /lib/modules/6.6.60-v8-AMDGPU+ < trace.txt`

In this case, `/home/pi/linux/vmlinux` is the path to your active kernel `vmlinux`, and the path `/lib/modules/6.6.60-v8-AMDGPU+` is the path to your custom kernel modules directory.

> Thanks to [DanaGoyette](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/680#issuecomment-2463208120) for this debugging tip!
