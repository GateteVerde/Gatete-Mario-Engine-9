/// @description Finish pull

//If the puller object does exist
if (instance_exists(obj_puller)) {

    //Play 'Pickup' sound
    audio_play_sound(snd_pickup, 0, false);
    
    //Create vegetable
    with (instance_create_depth(obj_mario.x-8, y, -4, obj_turnip_out)) {
    
        sprite_index = other.sprite_index
		image_index = 1;
        myveggie = obj_pullkey_up;
    }
    
    //Destroy
    instance_destroy();
}