/// @description Change P-Meter frame

//If the P-Wing is active
if (global.pwing == 1) {
	
	flash = !flash;
	alarm[0] = 7;
}

//Otherwise
else {

	if (instance_exists(obj_mario))
	&& (obj_mario.pmeter < global.pmeter_limit) {
	
		flash = 0;
		alarm[0] = 1;
	}
	else {
	
		flash = !flash;
		alarm[0] = 7;
	}
}