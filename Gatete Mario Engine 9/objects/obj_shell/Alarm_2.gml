/// @description Blink

if (anim == 0) {
	
	anim = 1;
	alarm[2] = 15;
}
else if (anim == 1) {

	anim = 0;
	alarm[2] = 60+random(round(120));
}
