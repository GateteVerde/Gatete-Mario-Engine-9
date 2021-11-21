/// @description Shake if Mario is on this platform

//Repeat the process
alarm[1] = 1;

//Change offset if this donut is shaking
if (ready == 1) {

	if (offset == 1)
		offset = -1;
	else
		offset = 1;
}
else
	offset = 0;
