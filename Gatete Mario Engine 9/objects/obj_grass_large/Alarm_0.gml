/// @description Finish pull

//If the puller object does exist
if (instance_exists(obj_mario_puller)) {
	
	//Play 'Pickup' sound
	audio_play_sound(snd_pickup, 0, false);
    
    //Create vegetable
    with (instance_create_depth(obj_mario.x, y+8, -4, obj_turnip_out)) {
    
        sprite_index = spr_turnip_large;
        myveggie = obj_turnip_large;
		big = true;
    }
    
    //Destroy
    instance_destroy();
}