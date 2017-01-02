#!/bin/bash

#sudo add-apt-repository ppa:webupd8team/atom
#sudo apt-get update
#sudo apt-get install atom

apm install javascript-snippets &&
apm install save-session &&
apm install atom-beautify &&
apm install highlight-selected &&

#themes
apm install monokai-seti &&
apm install atom-material-syntax-dark &&
apm install atom-material-syntax-dark &&
apm install seti-syntax &&
apm install seti-ui

echo '{
  "html": {
    "brace_style": "collapse",
    "indent_char": " ",
    "indent_scripts": "normal",
    "indent_size": 4,
    "max_preserve_newlines": 1,
    "preserve_newlines": true,
    "unformatted": ["a", "sub", "sup", "b", "i", "u"],
    "wrap_line_length": 0
  },
  "css": {
    "indent_char": " ",
    "indent_size": 4
  },
  "js": {
    "indent_size": 4,
    "indent_char": " ",
    "indent_level": 0,
    "indent_with_tabs": false,
    "preserve_newlines": true,
    "max_preserve_newlines": 2,
    "jslint_happy": true
  },
  "python": {
    "indent_size": 4,
    "indent_char": " ",
    "indent_level": 0,
    "indent_with_tabs": false
  }
}' > /home/$USER/.atom/packages/atom-beautify/src/.jsbeautifyrc

echo "'.editor':
  'f12': 'atom-beautify:beautify-editor'" > /home/$USER/.atom/keymap.cson 

