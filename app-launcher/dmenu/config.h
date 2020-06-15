/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"Source Code Pro:style=Regular:size=8"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char col_gray1[]          = "#2e3440";
static const char col_gray4[]          = "#4c566a";
static const char col_white2[]         = "#e5e9f0";
static const char col_white3[]         = "#eceff4";
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { col_white2, col_gray1 },
	[SchemeSel]  = { col_white3, col_gray4 },
	[SchemeOut]  = { col_gray4, col_white2 },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
