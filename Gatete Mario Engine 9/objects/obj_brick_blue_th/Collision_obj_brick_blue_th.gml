/// @description Destroy

//If this block is being held
if (held) {

    //Play 'Kick' sound
    audio_play_sound(snd_kick, 0, false);

    //Get 1000 points
    with (instance_create_depth(x-8, y, -6, obj_score)) value = 1000;
    
    //Create spin thump
    with (instance_create_depth(bbox_left+bbox_right/2, bbox_top+bbox_bottom/2, -6, obj_smoke)) sprite_index = spr_spinthump;
    
    //Destroy both brick
    event_user(0);
    with (other) event_user(0);
}

//Otherwise, just shatter the other one
else {

    if (ready)
        with (other) event_user(0);
}