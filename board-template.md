---
layout: board
title: "Name of Board Here"
short_description: Insert a single sentence summary of the board here.
status: Here
picture: "/images/board-(and-then-insert-name-here-without-parentheses).jpg"
github_issue: "https://github.com/geerlingguy/raspberry-pi-pcie-devices/issues/ID-here"
link: https://amzn.to/product-link-here
videos: []
---
# INSTRUCTIONS:

### Create a new file in the `_boards_cm` directory.

1. Title it with the board name in all-lowercase, using dashes to separate words.
2. Save it as Markdown file (.md extension).
3. Paste the contents of this template into the new file.
4. Replace all the values in its top section with the proper information:
  - `layout`: Should be left alone! Don't change this.
  - `title`: Replace *Name of Board Here* with the full name of the board.
  - `short_description`:
  - `status`: Can be one of these:
    * prototype
    * production
  - `picture`: Can have a path to a picture like `/images/[type]-card.jpg`, or `false`. Make sure you remember to drop the image into the `images` folder before you submit your pull request!
  - `github_issue`: Should link to the GitHub issue corresponding to this card.
  - `link`: should link to the Amazon product page for this card. If no Amazon listing is available, you can substitute a different website instead.
  - `videos`: Is a list of YouTube video URLs. If there is a video to add, delete the `[]`, hit return, tab in once, add a dash, press the spacebar, and then paste the video url.

Finally, replace all content below the second `---` line with a description of the board, save your changes, and submit the finished entry via pull request.
