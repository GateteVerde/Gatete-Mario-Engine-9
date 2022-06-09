/// @description Launch fire

//If Mario does not exist or it does exist and it's not transforming
if (!instance_exists(obj_mario))
|| ((instance_exists(obj_mario)) && (instance_exists(obj_mario_transform))) {

    alarm[0] = 1;
    exit;
}

//Play 'Flamethrower' sound
audio_stop_sound(snd_flamethrower);
audio_play_sound(snd_flamethrower, 0, false);

//Create flame
with (instance_create_depth(x+8, y+8, 50, obj_flamethrower_fire)) {

	motion_set(other.direct, 5.25);
	xspeed = hspeed;
	yspeed = vspeed;
	speed = 0;
}

//Loop
if (count > 0) {
	
	alarm[0] = 12;
	count--;
}
else
	alarm[1] = 150;