/// @description Finish pull

//If the puller object does exist
if (instance_exists(obj_puller)) {

    //Play 'Pickup' sound
    audio_play_sound(snd_pickup, 0, false);
    
    //Create vegetable
    with (instance_create_depth(obj_mario.x, y, -4, obj_turnip_out)) {
    
        sprite_index = spr_turnip_shell;
		enemy = true;
		myveggie = obj_turnip_shell;
    }
    
    //Destroy
    instance_destroy();
}