/// @description Change palette

//Stop
stop = 1;

//If still moving
if (abs(xspeed) > 0) {

	alarm[0] = 1;
	exit;
}

//Otherwise
else {
		
	//Toss a lightning after 1 and a half second
	if (alarm[1] == -1) {
		
		alarm[1] = 90;
	}
		
	//Repeat the process
	alarm[0] = 4;
		
	//Change palette
	pal++;
	if (pal > 3)
		pal = 0;
}