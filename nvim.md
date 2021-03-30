## VIM/NVIM - basic commands

* Basic

```
:q	exit
:q!	exit without save
:w	save
:wq	save and exit
```

* Move

```
h	left
j	down
l	up
k	right

5h	move 5 positions left
5j	move 5 lines down
5k	move 5 lines up
5l	move 5 positions right

w	goto next word
e	goto end of current word
b	goto last word
0	goto end of the line
$	goto start of the line

gg	goto file's start
G	goto file's end
12gg	goto line 12
85G	goto line 85
```

* Edit

```
i	insert mode
a	insert mode on next letter
A	insert mode at the end of current line
o	insert mode creating a new line down
O	insert mode creating a new line up
x	delete current letter

gd	highlight the word in the whole file, moving to where is declared if is a var/const
gf	open the file (selecting a imported path for example)
C+ o	last file
C+ i	next file
```

* Select

```
v	visual mode (selecting text)
V	select all current line
y	copy
x	cut
p	paste after cursor
P	paste before cursor
u	undo
C+ r	redo
```

* Delete and replace

```
dd	delete line
dw	delete word
d$	delete from cursor to the end of the line

r	replace current letter
R	replace current letter in a loop, going forward the line
cw	change word - delete from cursor to the end of the word and insert mode
ciw	change inner word - delete all the word and insert mode
```

* Search

```
/text	search 'text' in the file #NOTE: nvim searchs in whole file, but vim only after the cursor
?text	search 'text' in all the file
Enter	close search and go back the file, keeping the highlight in the searched words
n	goto next coincidence
N	goto prev coincidence

%	goto the closing/starting tags of the block: (), [], {}
	#NOTE: [v] for visual, [%] to move to the closing tag. All the block selected to copy, delete...
```

* Select and replace texts

```
:s/text1/text2		replace 'text1' with 'text2' in current line, only the first coincidence
:s/text1/text2/g	replace 'text1' with 'text2' in current line, all the coincidences

:%s/text1/text2/g	replace " with " in the whole file without ask
:%s/text1/text2/gc	replace " with " in the whole file asking for each coincidence
```



## VIM/NVIM - Config files

* VIM: `~/.vimrc`
* NVIM: `~/.config/nvim/init.vim`

This conf files can become as large as a few hundred lines. So its recomended to play with it, learning some interesting confs, understanding how they works and then creating a whole conf file with a generator like: https://vim-bootstrap.com/

With that, you will get a robust conf file as start point, which you will be able to custimize easily just adding some specific plugins not included, but having already configured almost every basic conf.

That generator use **vim-plug** as plugin manager. If you want to use another one, feel free to modify the plugins zone and use another one.

The generator offers different themes for vim. But if you want to use another one, just change the 2 lines about the theme: the theme import and the colorscheme def. Check my init.vim on this repo and search 'gruvbox' (the name of the theme) to see where. 





