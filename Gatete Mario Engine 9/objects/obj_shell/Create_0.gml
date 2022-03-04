/// @description Koopa Shell

//Inherit the parent event
event_inherited();

//Do not animate
image_speed = 0;
image_index = 0;

//Blink
alarm[0] = 312;

//Destroy
alarm[1] = 432;

//Whether the shell is flipped
flip = 0;

//Whether the shell is shaking
offset = 0;

//Whether there's a koopa inside
koopainside = 0;