/// @description Spit a fireball

//Play 'Burn' sound
audio_play_sound(snd_burn, 0, false);

//Set frame
image_index = 0;

//Spit a fireball
alarm[1] = 96;

//Spit a fireball towards the player
with (instance_create_depth(x, y, -2, obj_panser_fire)) {
	
	//Set the sprite
	sprite_index = spr_panser_fire;

	//Set the motion
	yspeed = -4;
    xspeed = 1*sign(other.xscale);
}