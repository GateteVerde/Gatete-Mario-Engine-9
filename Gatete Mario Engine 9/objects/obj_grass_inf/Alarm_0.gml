/// @description Finish pull

//If the puller object does exist
if (instance_exists(obj_puller)) {

    //Play 'Pickup' sound
    audio_play_sound(snd_pickup, 0, false);
    
    //Create vegetable
    with (instance_create_depth(obj_mario.x, y+8, -4, obj_turnip_out)) {
    
        sprite_index = spr_turnip;
		image_index = obj_levelcontrol.turnip_type;
		myveggie = obj_turnip;
    }
    
    //Make invisible
	visible = false;
	
	//Respawn at 2 seconds
	alarm[1] = 120;
}