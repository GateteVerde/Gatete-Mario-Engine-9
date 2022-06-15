/// @description Spit a fireball

//Play 'Burn' sound
audio_play_sound(snd_burn, 0, false);

//Set frame
image_index = 2;

//Spit a fireball
alarm[2] = 20;

//Spit a fireball towards the player
with (instance_create_depth(x, y, -2, obj_panser_fire)) {
	
	//Set the sprite
	sprite_index = spr_panser_fire;

	//Set the motion
	yspeed = -4;
}