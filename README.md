# Raspberry Pi PCIe Devices

<!--- shields were customized from https://shields.io/ --->
![GitHub repo size](https://img.shields.io/github/repo-size/geerlingguy/raspberry-pi-pcie-devices)
![GitHub last commit](https://img.shields.io/github/last-commit/geerlingguy/raspberry-pi-pcie-devices)
![GitHub stars](https://img.shields.io/github/stars/geerlingguy/raspberry-pi-pcie-devices?style=social)
[![Sponsors](https://img.shields.io/github/sponsors/geerlingguy)](https://github.com/sponsors/geerlingguy#sponsors)
![license](https://img.shields.io/github/license/geerlingguy/raspberry-pi-pcie-devices?logoColor=blue)

[**Raspberry Pi PCIe Devices**](https://pipci.jeffgeerling.com/) is a compatibility database that tracks which devices are and are not compatible with the [Raspberry Pi CM4](https://www.raspberrypi.com/products/compute-module-4/).

<p align="center">
  <img src="/images/rpi-pcie-devices.png" alt="Raspberry Pi PCIe Devices site header"/>
</p>

<p align="center">
  <img src="/images/cm4-io-board-pcie-slot.jpeg" alt="CM4 IO Board PCIe Slot"/>
</p>

## 🔧 Setup and installation

To run a copy of this website in a local web development environment, you need to have **Jekyll**, **GitHub CLI** *OR* **GitHub Desktop**, and a local clone of the website's repository.

### Jekyll
This site is built using [Jekyll](https://jekyllrb.com/), a [Ruby](https://www.ruby-lang.org/en/) gem.

**To install Jekyll:**
1. Visit Jekyll's [installation page](https://jekyllrb.com/docs/installation/) in your browser
2. Click the guide for your operating system (macOS, Ubuntu, Other Linux, or Windows)
3. Follow the step-by-step instructions to install Jekyll.

### GitHub
There are two ways to use GitHub locally:
* via [GitHub CLI](https://cli.github.com/), using the command line
* via [GitHub Desktop](https://desktop.github.com/), an app available for macOS and Windows

## ⚙️ Development

Once you have Jekyll running and the [raspberry-pi-pcie-devices repository](https://github.com/geerlingguy/raspberry-pi-pcie-devices) cloned, you can build and run the site locally.

### Build the site locally
1. In the command line, `cd` into the `raspberry-pi-pcie-devices` folder that contains the cloned repository.
2. To build the site, run `jekyll serve`.
3. You should now be able to access the local site at http://localhost:4000 in your web browser of choice.

As long as `jekyll serve` is running, you'll be able to watch the site and all changes you make to it in real time.

## 🧑‍💻 Contributing

### Ways to contribute
* **Add a card or board to the list:** Use issues and pull requests to add new board entries and card entries to the site.
* **Test a card yourself:** If you want to test a card on your own, I'm happy to add it to the database, provided you give all the testing details, information like `lspci` and `dmesg` logs, etc. in a GitHub issue, and follow the project's conventions for card details.
* **Fix problems with the repository:** If you find any typos, incorrect links or images, or other issues in this repository, please submit a pull request to fix the problem or [open a new issue](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/new/choose) to point the problem out for someone else to fix.
* **Mail me a card or board:** I accept cards and boards mailed to me, and can occasionally pay shipping as well. I credit senders in all videos/posts that result from donated card testing!

### General instructions for contributing

To contribute to **Raspberry Pi PCIe Devices**, follow these steps:
1. [Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repository.
2. [Clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) that new repository to your device.
3. Create a [new branch](https://docs.github.com/en/desktop/contributing-and-collaborating-using-github-desktop/making-changes-in-a-branch/managing-branches#creating-a-branch).
3. (Optional) use `jekyll serve` to build the site in your local development environment while you're working on it.
4. Once you're satisfied with your changes, [commit them](https://docs.github.com/en/desktop/contributing-and-collaborating-using-github-desktop/making-changes-in-a-branch/committing-and-reviewing-changes-to-your-project).
5. [Push](https://docs.github.com/en/desktop/contributing-and-collaborating-using-github-desktop/making-changes-in-a-branch/pushing-changes-to-github) the changes to the correct branch.
6. Create a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork).
7. Give yourself a high five, you did a great job. Thanks for contributing!

### Add a card
Add a new file named after the card in the appropriate `_cards_[type]` directory.
Copy the template out of [`card-template.md`](card-template.md) into this new file and follow the instructions it contains.

#### Specific example: Adding a network card
To add a network card to the database:
1. Make sure a GitHub [issue](https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues) exists for the card. Open a new issue for it you find that there isn't one.
2. Copy the template into a new Markdown file you create inside `_cards_network`.
3. Fill in the card information as described in [`card-template.md`](card-template.md).
4. Place a picture of the card named network-[name-of-card-here-minus-brackets].jpg inside the `images/` folder.
5. Submit a pull request with your changes.

### Add a board
Add a new file named after the card in the appropriate `_boards_cm` directory.
Copy the template out of [`board-template.md`](board-template.md) into this new file and follow the instructions it contains.

## 🤝 Support
Drop a ⭐ if this project helped you!

![Patreon](https://img.shields.io/badge/-Patreon-f96854?style=for-the-badge&logo=patreon&logoColor=white)

## 👤 Authors
### Jeff Geerling 💻
* Creator and maintainer
* [@geerlingguy](https://github.com/geerlingguy) on GitHub
* [![YouTube](https://img.shields.io/youtube/channel/subscribers/UCR-DXc1voovS8nhAvccRZhg?style=social)](https://www.youtube.com/c/JeffGeerling)

### Katie Geerling 🧑‍🔬
* Documentation writer and part-time contributor
* [@punnypenguins](https://github.com/punnypenguins) on GitHub

## 📝 License

This project is maintained by [Jeff Geerling](https://www.jeffgeerling.com/). The Raspberry Pi Compute Module 4 is a product of [Raspberry Pi (Trading) Limited](https://www.raspberrypi.org/about/).

_**Raspberry Pi PCIe Devices** uses the [GNU General Public License, version 3](https://opensource.org/licenses/GPL-3.0)._
