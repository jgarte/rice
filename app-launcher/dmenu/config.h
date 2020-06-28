/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"Source Code Pro:style=Regular:size=8"
};
static const char col_gray1[]  = "#2E2E2E";
static const char col_gray2[]  = "#5C5C5C";
static const char col_white[]  = "#E9E9E9";
static const char *colors[SchemeLast][2] = {
	             /*     fg         bg       */
	[SchemeNorm] = { col_white, col_gray1 },
	[SchemeSel]  = { col_white, col_gray2 },
	[SchemeOut]  = { col_gray2, col_white },
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
