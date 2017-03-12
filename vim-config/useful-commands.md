VIM - useful commands
=====================

General
-------

* save: ` :w `
* exit: ` :q `
* save and exit: ` :wq `
* insert mode: `i`
* visual mode: `v`

Moving
------

* move by words: `w`
* page down: `CTRL-d`
* page up: `CTRL-u`
* go to line n: `n + G`
* go to the beginning of file: `gg`
* go to the end of file: `G`
* navigation between splits: `CTRL-w-{ h | j | k | l }`

Editing
-------

* change word: `cw`
* change two words: `c2w`
* change text at the end of line: `c$`
* add text at the end of line: A
* add a new line after cursor: `o`
* add a new line before cursor: `O`
* copy text: visual mode `v` and select text; enter `y` to copy and `p` to paste it

Deleting
--------

* delete char: `x`
* delete word: `dw`
* delete two words: `d2w`
* delete text to the end line: `d$`
* delete entire line: `dd`

Tab
---

* open new file: `:tabedit {file}`
* move between tabs: `gt` `gT`


Searching and replacing
-----------------------

* search word forward: `/word`
* search next forward: `n`
* search word backward: `?word`
* search next backward: `N`
* substitute words: `:%s/word/newword/g`
* substitute words with confirm: `:%s/word/newword/gc`

Undo/Redo
---------

* undo last command: `u`
* redo last undo: `CTRL-r`
