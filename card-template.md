---
layout: card
title: "Name of Card Here"
picture: "/images/[card type]-(and-then-insert-name-here-without-parentheses).jpg"
functionality: "Functionality goes here"
driver_required: "Answer goes here"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/ID-here"
buy_link: https://amzn.to/product-link-here
videos: []
---
# INSTRUCTIONS:

### Create a new file in the appropriate `_cards_[type]` directory.

1. Title it with the card name in all-lowercase, using dashes to separate words.
2. Save it as Markdown file (.md extension).
3. Paste the contents of this template into the new file.
4. Replace all the values in its top section with the proper information:
  - `layout`: Should be left alone! Don't change this.
  - `title`: Replace *Name of Card Here* with the full name of the board.
  - `picture`: Can have a path to a picture like `/images/[card type]-card-name.jpg`, or `false`.
    - `card type` can be
      - adapter
      - gpu
      - m2
      - multimedia
      - network
      - other
      - storage
      - usb
    - `file type` can be
      - png
      - jpg
      - jpeg
    Make sure you remember to drop the image into the `images` folder before you submit your pull request!
  - `functionality`: Can be one of the following:
    * "Currently Testing"
    * "Full"
    * "Partial"
    * "None"
  - `driver_required`: Can be one of the following:
    * "Yes"
    * "Maybe"
    * "No"
  - `github_issue`: Should link to the GitHub issue corresponding to this card.
  - `buy_link`: Should link to the Amazon product page for this card. If no Amazon listing is available, you can substitute a different website instead.
  - `videos`: Is a list of YouTube video URLs. If there is a video to add, delete the `[]`, hit return, tab in once, add a dash, press the spacebar, and then paste the video url.

Finally, replace all content below the second `---` line with a description of the card, save your changes, and submit the finished entry via pull request.
