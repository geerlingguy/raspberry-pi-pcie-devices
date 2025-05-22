---
layout: board
title: "Type-or-Talk V2"
short_description: A mechanical keyboard with private, local AI speech to text using a CM5.
status: prototype
picture: "/images/board-type-or-talk-v2.jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/734"
link: https://typeortalk.com/products/typeortalk-v2-keybaord
videos: []
---
The [Type-or-Talk V2](https://typeortalk.com/products/typeortalk-v2-keybaord) is a 'smart keyboard', which is a functional mechanical keyboard (powered by RP2040), with an integrated CM5 that runs Whisper AI speech to text transcription, a local/private offline model.

Being a standard USB keyboard, it works with any computer, even older computers which wouldn't be able to run an AI model on their own. And having no Internet connection by default, it does not require sending your private voice recordings over the cloud for telemetry or speech recognition.

The early prototype version of the board that I've tested has some bodges and a few software bugs that make it difficult to use for much beyond demos, but it is fully functional and shows promise.

I've investigated running [WhisperLive](https://github.com/collabora/WhisperLive) or [whisper_streaming](https://github.com/ufal/whisper_streaming) on the CM5 instead of the current software; it seems like with some tweaking (and moving an 'active' LED to the topside somewhere, so you can see when the keyboard is listening more easily), this would be a compelling product for anyone who can't _always_ type, and also wants a simple speech to text option that works independent of the computer(s) they're using.