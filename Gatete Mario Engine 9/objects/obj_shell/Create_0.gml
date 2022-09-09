/// @description Koopa Shell

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to Yoshi?
edible = 1;

//Do not animate
image_speed = 0;
image_index = 0;

//Set offset
alarm[0] = 312;

//Destroy
alarm[1] = 432;

//Animate eyes
alarm[2] = 60;

//Whether the shell is flipped
flip = 0;

//Whether the shell is shaking
offset = 0;

//Eye Animation
anim = 0;

//Whether there's a koopa inside
koopainside = 0;

//Is this enemy a shell?
is_shell = 1;