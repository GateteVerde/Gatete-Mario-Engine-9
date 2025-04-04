/// @description Finish pull

//If the puller object does exist
if (instance_exists(obj_mario_puller)) {
	
	//Play 'Pickup' sound
    audio_play_sound(snd_pickup, 0, false);
    
    //Create vegetable
    with (instance_create_depth(obj_mario.x, y+8, -4, obj_turnip_out)) {
    
		//Get sprite
        sprite_index = spr_flipblock_big_held;
		
		//Get frame
		image_speed = 0;
		image_index = 0;
		
		//Set the resulting item
        myveggie = obj_flipblock_big_held;
		
		//Pull up
		alarm[5] = 20;
		
		//Mark as big
		big = true;
    }
    
    //Destroy
    instance_destroy();
}