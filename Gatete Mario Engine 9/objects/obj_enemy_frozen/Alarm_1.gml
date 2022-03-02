/// @description Free the enemy

//Play 'Icicle' sound
audio_play_sound(snd_icicle, 0, false);

//Create sparks
repeat (32) {

    with (instance_create_depth(round(bbox_left + bbox_right) / 2, round(bbox_top + bbox_bottom) / 2, -4, obj_sparkle))
        motion_set(random(360), random(1));
}

//Create enemy
if (ret != -1) {
	
	unfreeze = instance_create_layer(x, y, "Main", ret);
	if (ret_spr != -1)
		with (unfreeze) sprite_index = other.ret_spr;
}

//Destroy
instance_destroy();