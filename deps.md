# deps

For building dwm and st you will need to make sure the following packages are installed

```
freetype2 libx11 libxft libxinerama
```

If you're on arch I would recommend installing `libxft-bgra` from the aur instead of `libxft` as it makes emojis work in st.

To be able to launch applications you should install `dmenu`, by default it uses chromium as the broser so I would recommend installing [ungoogled-chromium](https://github.com/Eloston/ungoogled-chromium).

If you want to use everything that I use, look at [other.md](other.md) as well as my application binds in [dwm's config](wm/dwm/config.h)
