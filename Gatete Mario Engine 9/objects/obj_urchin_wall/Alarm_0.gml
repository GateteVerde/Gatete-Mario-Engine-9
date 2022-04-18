/// @description Blink

if (face > 5) {

	face = 0;
	alarm[0] = 60 + random(round(180));
}
else {

	face++;
	alarm[0] = 2;
}
