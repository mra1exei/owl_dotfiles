//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/

	{"", "/home/owl/dwm-6.2/script/dwmcpu",					30,		0},
	{"", "/home/owl/dwm-6.2/script/dwmmemory",				30,		0},
	{"", "/home/owl/dwm-6.2/script/dwmdisk",				30,		0},
	{"", "/home/owl/dwm-6.2/script/dwmweather",				1,		0},
	{"", "/home/owl/dwm-6.2/script/dwmvol",					30,		0},
	{"", "/home/owl/dwm-6.2/script/dwmkeyboard",				1,		0},
	{"", "/home/owl/dwm-6.2/script/dwmclock",				30,		0},

};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " ";
static unsigned int delimLen = 5;
