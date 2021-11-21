/// @description Change P-Meter frame

if (instance_exists(obj_mario))
&& (obj_mario.pmeter < global.pmeter_limit) {
	
	flash = 0;
	alarm[0] = 1;
}
else {
	
	flash = !flash;
	alarm[0] = 7;
}