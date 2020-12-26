# Contributing to the Raspberry Pi PCIe Database

Testers welcome!

There are many ways to contribute:

  1. I accept cards mailed to me, and may be able to pay shipping. I can't promise to test the card in a timely fashion, but I will try to, and I will credit you in any videos/posts that result from card testing!
  2. If you find any typos, incorrect links or images, or other issues, please submit a PR to fix it!
  3. If you want to test a card on your own, I'm happy to add it to the database, provided you give all the testing details, information like `lspci` and `dmesg` logs, etc. in a GitHub issue, and follow the project's conventions for card details.

## Adding a Card

Add a file named after the card into the appropriate `_cards_[type]` directory. Copy the template out of [`card-template.md`](card-template.md) into this new file.

Add a picture of the card into the `images/` directory, prefixed by `[type]-`, and make sure to reference the full path to the image in the `picture` frontmatter on the card post.

For example, for a network card:

  1. Make sure there's a GitHub issue that exists for the card.
  2. Copy the template into a new file inside `_cards_network`.
  3. Fill in the details of the card.
  4. Put a picture of the card named `network-[name-of-card].jpg` inside `images/`.
  5. File a PR with your changes.
