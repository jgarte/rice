# dwm

A moderately heavily modified build of dwm with the nord colorscheme.

## changes

Fullsceen in application and on screen is seperate. This means that you can fullscreen, for example, a youtube video without it taking up the entire screen. If you then wish for the window to go fullscreen you can do `super + f` to fullscreen any window.

Dwm will now execute a script located at '~/.config/dwm/autostart.sh' on startup. This can be used for launching programs such as sxhkd, picom or a status bar updater.

I've also added gaps to every layout, except for monocle.

There are also some patches that I've applied:

autoresize - solves windows sometimes not resizing

autorestart - you can now restart dwm by pressing `shift + super + r`, this is usefull for when changing settings

awsomebar - the names of the monitors windows are now visible at the top

centeredmaster - adds a centered master layout

cyclelayouts - lets you cycle between layouts with a keybind

fibonnaci - adds layouts based on the golden ratio
