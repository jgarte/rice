# deps

For building dwm and st you will need to make sure the following packages are installed

```
freetype2 libx11 libxft libxinerama
```

If you're on arch I would recommend installing `libxft-bgra` from the aur instead of `libxft` as it makes emojis work in st.

You will also need the following packages installed in order to use my files

```
picom tmux
```

My scripts currently use `/bin/dash` as their shell as using dash as `/bin/sh` hasn't been working out for me due to scripters that can't use shellcheck or write `#!/bin/bash` (IT REALLY ISN'T THAT HARD PEOPLE), so to use my scripts you will either need dash or to change the used shell for the scripts.

The used browser is chromium, however I wouldn't recommend you using it. Instead I would recommend installing [ungoogled-chromium](https://github.com/Eloston/ungoogled-chromium).

If you want to use everything that I use, look at [other.md](other.md) as well as my application binds in [dwm's config](wm/dwm/config.h)
