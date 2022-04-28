/// @description Reset animation

//If Mario does exist
if (instance_exists(obj_mario)) {
	
	//Play 'Burn' sound
	audio_play_sound(snd_burn, 0, false);

	//Spit a fireball
	with (instance_create_depth(x + 8 * sign(xscale), y+8, 50, obj_plantfire))
		motion_set(point_direction(x, y, obj_mario.x, obj_mario.y), 1.5);
}

//Repeat
alarm[0] = 180;

//Do not animate
image_speed = 0;
image_index = 0;
