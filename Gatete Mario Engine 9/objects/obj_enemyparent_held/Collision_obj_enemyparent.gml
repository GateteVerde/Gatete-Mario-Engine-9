/// @description Kill enemy by throwing another enemy

//If this NPC is being held or it's not being held and it's moving
if (held == true) 
|| ((held == false) && (yspeed != 0)) {

    //Play 'Kick' sound
    audio_play_sound(snd_kick, 0, false);

    //Get 1000 points
    with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score)) value = 1000;
    
    //Create spin thump
    with (instance_create_depth(round(bbox_left + bbox_right) / 2, round(bbox_top + bbox_bottom) / 2, -6, obj_smoke)) sprite_index = spr_spinthump;
    
    //Destroy both NPCs
    with (other) {
		
		killer_id = other.id;
		event_user(0);
	}
	
	//Get other object id
	enemy_id = other.id;
	
	#region KILL
	
		//Kill NPC
		imdead = instance_create_depth(x, y, -6, obj_enemy_dead);
		
		//Hereby sprite
		imdead.sprite_index = sprite_index;

		//Hereby frame
		imdead.image_index = image_index;

		//Hereby facing direction
		imdead.image_xscale = xscale;
		
		//Set horizontal speed
		if (enemy_id.x < x)
			imdead.hspeed = 1;
		else
			imdead.hspeed = -1;
			
		
	#endregion
	
	//Destroy
	instance_destroy();
}