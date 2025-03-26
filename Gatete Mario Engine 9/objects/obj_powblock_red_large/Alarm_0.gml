/// @description Finish pull

//If the puller object does exist
if (instance_exists(obj_mario_puller)) {
	
	//Play 'Pull End' sound
	audio_play_sound(global.sound_pull_end, 0, false); 
    
    //Create vegetable
    with (instance_create_depth(obj_mario.x, y + 16, -4, obj_turnip_out)) {
    
        sprite_index = spr_powblock_red_large_up;
        myveggie = obj_powblock_red_large_up;
    }
    
    //Destroy
    instance_destroy();
}