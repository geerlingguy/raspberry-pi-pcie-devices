# Intel I340-T4 Benchmark Playbook

This playbook is meant to run an `iperf` benchmark against a Pi with the Intel I340-T4 PCIe NIC.

The playbook requires Ansible to be installed on a controller computer, which should be able to see four computers connected directly to the ports on the NIC, which are mapped with static IPs via the `/etc/dhcpcd.conf` file.

Additionally, `iperf` should already be installed on _all_ the computers, including the Pi.

The playbook can be run with:

```
ansible-playbook benchmark.yml
```

See this issue for more details and network setup instructions: [Issue #3: Test 4-interface Intel NIC I340-T4](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/3)
