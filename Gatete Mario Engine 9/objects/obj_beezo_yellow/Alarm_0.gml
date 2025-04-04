/// @description Finish pull

//If the puller object does exist
if (instance_exists(obj_mario_puller)) {

    //Play 'Pickup' sound
    audio_play_sound(snd_pickup_npc, 0, false);
	
	//Play 'Pull' sound
	play_voiceline(global.voiceline_pull, 0, false); 
    
    //Create vegetable
    with (instance_create_depth(obj_mario.x, y, -4, obj_turnip_out)) {
    
        //Get the sprite
        sprite_index = other.sprite_index;
        
        //Get the facing direction
        image_xscale = other.xscale;
        
        //Set the respawn object
        turnback = -1;
        myveggie = obj_enemy_carried;
        
        //Pull up
        alarm[5] = 3;
        
        //Mark as enemy
        enemy = true;
    }
    
    //Destroy
    instance_destroy();
}
