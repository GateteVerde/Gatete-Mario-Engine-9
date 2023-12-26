/// @description Play sound and create a lava effect.

//Play sound
audio_play_sound(snd_burn, 0, false);

//Check for lava
lava = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+32, obj_lava, 0, 0);

//If there's lava
if (lava) {
	
	//Create a lava splash
	with (instance_create_depth(x, lava.y+8, -6, obj_smoke)) {
	
		sprite_index = spr_splash_lava_ceiling;
	}
}