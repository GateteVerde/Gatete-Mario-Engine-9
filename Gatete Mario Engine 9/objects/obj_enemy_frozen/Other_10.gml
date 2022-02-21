/// @description Shatter block

//Play 'Icicle' sound
audio_play_sound(snd_icicle, 0, false);

//Create sparks
repeat(32) {

    with (instance_create_depth(round(bbox_left + bbox_right) / 2, round(bbox_top + bbox_bottom) / 2, -4, obj_sparkle))
        motion_set(random(360), random(1));
}

#region CREATE DEFUNCT ENEMY

	//Create dead object
	imdead = instance_create_depth(x, y, -6, obj_enemy_dead);

	//Hereby sprite
	imdead.sprite_index = sprite_index;

	//Hereby frame
	imdead.image_index = image_index;

	//Hereby facing direction
	imdead.image_xscale = xscale;
#endregion

//Destroy
instance_destroy();