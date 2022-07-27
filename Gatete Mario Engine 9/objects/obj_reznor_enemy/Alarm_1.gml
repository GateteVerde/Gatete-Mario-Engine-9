/// @description Fire Projectiles

//Play 'Magic' sound
audio_play_sound(snd_magic, 0, false);

//Start shooting fire
alarm[0] = 120 + round(random(120));

//Close mouth
alarm[2] = 30;

//Create a fireball
with (instance_create_depth(x + 8 * sign(xscale), y, -6, obj_plantfire)) {
	
	//Set sprite
	sprite_index = spr_reznor_fire;
	
	//Set motion
	motion_set(point_direction(x, y, obj_mario.x, obj_mario.y), 1.5);
}