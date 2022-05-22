/// @description Play sound and create a lava effect.

//Play sound
audio_play_sound(snd_burn, 0, false);

//Check for nearby lava.
lava = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_lava, 0, 0);

//If there's lava, create a lava splash
if (lava) {
	
	//Create a lava splash
    with (instance_create_depth(x, lava.y-4, -6, obj_smoke))
		sprite_index = spr_splash_lava;
}
