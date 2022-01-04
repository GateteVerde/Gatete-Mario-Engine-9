/// @description Finish pull

//If the puller object does exist
if (instance_exists(obj_puller)) {

    //Play 'Pickup' sound
    audio_play_sound(snd_pickup, 0, false);
    
    //Create vegetable
    with (instance_create_depth(obj_mario.x-8, y+8, -4, obj_turnip_out)) {
    
        sprite_index = spr_turnip;
		myveggie = obj_turnip;
    }
    
    //Destroy
    instance_destroy();
}

//If the grass does respawn
if (respawn == true) {

	//Set growing sprite
	sprite_index = spr_grass_grow;
	
	//Do not animate
	image_speed = 0;
	image_index = 0;
	
	//Make invisible and make visible after 2 seconds
	visible = false;
	alarm[1] = 120;
}