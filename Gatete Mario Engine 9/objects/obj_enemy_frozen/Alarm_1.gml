/// @description Free the enemy

//Play 'Icicle' sound
audio_play_sound(snd_icicle, 0, false);

//Create sparks
repeat (32) {

    with (instance_create_depth(bbox_left + sprite_width / 2, bbox_top + sprite_height / 2, -4, obj_sparkle))
        motion_set(random(360), random(1));
}

//Create enemy
if (ret != -1) then instance_create_layer(x, y, "Main", ret);

//Destroy
instance_destroy();