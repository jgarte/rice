# Keybinds

These are all the keybinds I use, these are subject to change and might not always be kept up to date properly.

## dwm

These are the keybinds used to control the wm and launch apps

### WM

Toggle bar visibility `Super + b`

Focus next window in the stack `Super + j`

Focus previous window in the stack `Super + k`

Increase amount of master windows `Super + Shift + I`

Decrease amount of master windows `Super + Shift + D`

Move current window to top of stack `Super + z`

Alternate between latest tag sets `Super + Tab`

Kill window `Super + Shift + Q`

Set layout to centered master `Super + u`

Set layout to tiled `Super + t`

Set layout to monocle `Super + m`

Set layout to Fibonacci spiral `Super + o`

Set layout to Fibonacci dwindle `Super + r`

Toggle window between floating and managed `Super + Shift + Space`

Toggle fullscreen `Super + f`

### monitors

Focus next monitor `Super + .`

Focus previous monitor `Super + ,`

Send window to next monitor `Super + Shift + .`

Send window to previous monitor `Super + Shift + ,`

### volume

Lower volume `XF86 AudioLowerVolume` / `Super + -`

Raise volume `XF86 AudioRaiseVolume` / `Super + =`

### brightness

Lower brightness `XF86 MonBrightnessDown`

Raise brightness `XF86 MonBrightnessUp`

Lower brightness more `Shift + XF86 MonBrightnessDown`

Raise brightness more `Shift + XF86 MonBrightnessUp`

Minimize brightness `Super + XF86 MonBrightnessDown`

Maximize brightness `Super + XF86 MonBrightnessUp`

### applications

dmenu `Super + d`

st `Super + Return`

python2 terminal `Super + p`

cmus terminal `Super + c`

cordless terminal `Super + Shift + C`

ungoogled chromium `Super + BackSpace`

setbg script `Super + s`

steam `Super + Shift + S`

vim `Super + v`

discord `Super + Shift + V`

lutris `Super + g`

screengrab `Print`

### tags

Show all tags `Super + 0`

Stick window to all tags `Super + 0`

Show only tag X `Super + X`

Send window to tag X `Super + Shift + X`

Stick window to tag X `Super + Shift + Control + X`

Toggle tag X `Super + Shift + X`

## tmux

These are a list of all the changed bindings in tmux. The default vi mode binds are still present.

### normal mode

Prefix `Control + a`

Resize pane `Alt + h/j/k/l`

Create pane in direction `prefix h/j/k/l`

Navigate panes (works with vim) `Control + h/j/k/k`

Paste `prefix p`

Previous window `prefix N`

### copy mode

Copy mode `prefix y` / `prefix [`

Begin copy selection `v`

Square copy mode `Control + v`

Copy `y`

## vim

Of course I won't list all vim binds, but rather just the ones I've added

### general

`:q` `Control + c` / `Control + d`

localleader `Space`

Goyo / zen mode `localleader z m`

Indent line `Tab`

Reverse indent `Shift + Tab`

Fold `localleader fo`

Fold recursively `localleader fr`

### text

Document preview `localleader d p`

#### Groff

Toggle hex editing `localleader h e`

Groff compile `localleader g c`

Groff loud compile `localleader g l c`

Groff compile to preview `localleader g p`

#### Pandoc

Markdown compile `localleader m c`

Markdown loud compile `loaclleader m l c`

Markdown slides compile `localleader m s c`

Markdown slides loud compile `loaclleader m s l c`

Markdown slides preview `loaclleader m s p`

#### spellchecking

Swedish spellcheck `localleader s s`

English spellcheck `localleader s e`

Turn off spellcheck `localleader s o`

Jump to next misspelt word `localleader s n`

Jump to previous misspelt word `localleader s N`

Get suggestions for misspelt word `localleader s c`

Add misspelt word to dictionary `localleader s a`

Remove word from dictionary `localleader s r`

Ban word from dictionary `localleader s b`

Unban word from dictionary `localleader s u`
