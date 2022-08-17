/// @description Finish pull

//If Birdo is still wearing her bowtie
if ((bowtie == 1) && (type > 0)) {

	//If the puller object does exist
	if (instance_exists(obj_mario_puller)) {

	    //Play 'Pickup' sound
	    audio_play_sound(snd_pickup, 0, false);
    
	    //Create vegetable
	    with (instance_create_depth(obj_mario.x, y-21, -4, obj_turnip_out)) {
    
	        //Get the sprite
	        sprite_index = spr_birdo_bowtie_pickup;
        
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
		
		//Bowtie has been picked up
		bowtie = 0;
	}
}
