/// @description Shoot an egg

//If Birdo is not jumping or it has been hurt
if (jumping > 0)
|| (invulnerable == true) {
	
	alarm[2] = 1;
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
alarm[1] = -1;

//Shoot the egg
alarm[3] = 30;