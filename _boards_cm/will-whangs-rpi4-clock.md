---
layout: board
title: "Will Whang's RPi4 Clock"
short_description: A beautifully compact CM4-based clock prototype built with the Symmetricom Rubidium Oscillator.
status: prototype
picture: "/images/board-will-whangs-rpi4-clock.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/205"
link: https://twitter.com/will_whang/status/1431004730973556739/photo/1
videos: []
---
The RPI4 Clock by Will Whang ([@will127534](https://github.com/will127534)) uses the Symmetricom Rubidium Oscillator in a similar way to the [Time Card](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwi2qLagxuTyAhWKPM0KHdzCAFUQFnoECAMQAQ&url=https%3A%2F%2Fengineering.fb.com%2F2021%2F08%2F11%2Fopen-source%2Ftime-appliance%2F&usg=AOvVaw3Y_flunwDe2ZLdTI634iFh).

It looks like this board basically marries the Time Card to the Pi CM4 directly, making an even more compact time server package. Still has to wait on hardware timestamping support to get it working with the CM4's NIC, though (see: [raspberrypi/linux#4151](https://github.com/raspberrypi/linux/issues/4151)).

For more photos of the build process, see Will's Twitter thread [here](https://twitter.com/will_whang/status/1386915778390159360).
