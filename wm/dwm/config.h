/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx     = 0;        /* border pixel of windows */
static const unsigned int gappx        = 8;        /* gap pixel between windows */
static const unsigned int snap         = 8;       /* snap pixel */
static const int showbar               = 1;        /* 0 means no bar */
static const int topbar                = 1;        /* 0 means bottom bar */
static const char barsep               = ';';       /* seperates left and right bar text */
static const char *fonts[]             = { "Source Code Pro:style=Regular:size=8" };
static const char dmenufont[]          = "Source Code Pro:style=Regular:size=8";
static const char col_gray1[]          = "#2e3440";
static const char col_gray4[]          = "#4c566a";
static const char col_white2[]         = "#e5e9f0";
static const char col_white3[]         = "#eceff4";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_white2, col_gray1, col_gray1 },
	[SchemeSel]  = { col_white3, col_gray4, col_gray4  },
	[SchemeHid]  = { col_gray4, col_white2, col_white2  },
};

/* uncomment for status on all monitors */
#define MULTIPLEMON

/* autostart */
static const char autostartfilepath[] = "~/.config/dwm/autostart.sh";

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	NULL
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0.25;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ ">U>",      centeredfloatingmaster },
	{ "[T]",      tile },
	{ "[M]",      monocle },
 	{ "[O]",      spiral },
 	{ "[R]",      dwindle },
	{ NULL,       NULL},
};

/* key definitions */
#define GLOBALMODKEY Mod4Mask
#define WINDOWMODKEY Mod1Mask // not currently used
#define TAGKEYS(KEY,TAG) \
	{ GLOBALMODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ GLOBALMODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ GLOBALMODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ GLOBALMODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_white3, "-sb", col_gray4, "-sf", col_white3, NULL };
static const char *termcmd[]  = { "st", "-e", "tmux", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	/* WM managment */
	{ GLOBALMODKEY,                       XK_b,      togglebar,      {0} },
	{ GLOBALMODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ GLOBALMODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ GLOBALMODKEY|ShiftMask,             XK_i,      incnmaster,     {.i = +1 } },
	{ GLOBALMODKEY|ShiftMask,             XK_d,      incnmaster,     {.i = -1 } },
	{ GLOBALMODKEY,                       XK_h,      setmfact,       {.f = -0.01} },
	{ GLOBALMODKEY,                       XK_l,      setmfact,       {.f = +0.01} },
	{ GLOBALMODKEY|ShiftMask,             XK_h,      setmfact,       {.f = -0.10} },
	{ GLOBALMODKEY|ShiftMask,             XK_l,      setmfact,       {.f = +0.10} },
	{ GLOBALMODKEY,                       XK_z,      zoom,           {0} },
	{ GLOBALMODKEY,                       XK_Tab,    view,           {0} },
	{ GLOBALMODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ GLOBALMODKEY,                       XK_u,      setlayout,      {.v = &layouts[0]} },
	{ GLOBALMODKEY,                       XK_t,      setlayout,      {.v = &layouts[1]} },
	{ GLOBALMODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ GLOBALMODKEY,                       XK_o,      setlayout,      {.v = &layouts[3]} },
	{ GLOBALMODKEY,                       XK_r,      setlayout,      {.v = &layouts[4]} },
	{ GLOBALMODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ GLOBALMODKEY,                       XK_f,      togglefullscr,  {1} },
	{ GLOBALMODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ GLOBALMODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ GLOBALMODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ GLOBALMODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ GLOBALMODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ GLOBALMODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ GLOBALMODKEY|ShiftMask,             XK_e,      quit,           {0} },
	{ GLOBALMODKEY|ShiftMask,             XK_r,      quit,           {1} }, 
	/* Volume */
	{ 0,                                  XF86XK_AudioLowerVolume,   spawn, SHCMD("pactl set-sink-volume @DEFAULT_SINK@ -10%") },
	{ 0,                                  XF86XK_AudioRaiseVolume,   spawn, SHCMD("pactl set-sink-volume @DEFAULT_SINK@ +10%") },
	{ GLOBALMODKEY,                       XK_minus,                  spawn, SHCMD("pactl set-sink-volume @DEFAULT_SINK@ -10%") },
	{ GLOBALMODKEY,			              XK_KP_Equal,               spawn, SHCMD("pactl set-sink-volume @DEFAULT_SINK@ +10%") },
	/* Brightness */
	{ 0,                                  XF86XK_MonBrightnessUp,    spawn, SHCMD("xbacklight -inc 1 -time 50") },
	{ 0,                                  XF86XK_MonBrightnessDown,  spawn, SHCMD("xbacklight -dec 1 -time 50") },
	{ ShiftMask,                          XF86XK_MonBrightnessUp,    spawn, SHCMD("xbacklight -inc 10 -time 50") },
	{ ShiftMask,                          XF86XK_MonBrightnessDown,  spawn, SHCMD("xbacklight -dec 10 -time 50") },
	{ GLOBALMODKEY,                       XF86XK_MonBrightnessUp,    spawn, SHCMD("xbacklight -set 100 -time 50") },
	{ GLOBALMODKEY,                       XF86XK_MonBrightnessDown,  spawn, SHCMD("xbacklight -set 1 -time 50") },
	/* Applications */
	{ GLOBALMODKEY,                       XK_d,                      spawn, {.v = dmenucmd} },
	{ GLOBALMODKEY,                       XK_Return,                 spawn, {.v = termcmd} },
	{ GLOBALMODKEY,                       XK_p,                      spawn, SHCMD("st -e python2") },
	{ GLOBALMODKEY,                       XK_BackSpace,              spawn, SHCMD("$BROWSER") },
	{ GLOBALMODKEY,                       XK_s,                      spawn, SHCMD("setbg") },
	{ GLOBALMODKEY|ShiftMask,             XK_s,                      spawn, SHCMD("steam") },
	{ GLOBALMODKEY|ShiftMask,             XK_v,                      spawn, SHCMD("discord") },
	{ GLOBALMODKEY,                       XK_g,                      spawn, SHCMD("lutris") },
	{ 0,                                  XK_Print,                  spawn, SHCMD("scrot -u ~/img/screenshots/%Y-%m-%d-%T-screenshot.png") },
	{ GLOBALMODKEY,                                  XK_Print,                  spawn, SHCMD("scrot ~/img/screenshots/%Y-%m-%d-%T-screenshot.png") },
	/* Tags */
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button1,        togglewin,      {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         GLOBALMODKEY,   Button1,        movemouse,      {0} },
	{ ClkClientWin,         GLOBALMODKEY,   Button2,        togglefloating, {0} },
	{ ClkClientWin,         GLOBALMODKEY,   Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            GLOBALMODKEY,   Button1,        tag,            {0} },
	{ ClkTagBar,            GLOBALMODKEY,   Button3,        toggletag,      {0} },
};
