/// @description Shoot an egg

//If Birdo is not jumping or it has been hurt
if (jumping > 0)
|| (invulnerable == true) {
	
	alarm[1] = 1;
	exit;
}

//Set the shooting sprite
sprite_index = spr_birdo_shoot;

//Set shooting phase
shooting = 1;

//Stop moving horizontal
xspeed = 0;

//Do not animate
image_speed = 0;

//Reset alarms
alarm[0] = -1;

//Shoot the egg
alarm[2] = 30;