/// @description Spit another fireball

//Play 'Burn' sound
audio_play_sound(snd_burn, 0, false);

//Create a fireball
with (instance_create_depth(x, y-4, -2, obj_plantfire)) {
	
	motion_set(other.direct, 1.5);
	if (other.ice)
		sprite_index = spr_iceball;
}
