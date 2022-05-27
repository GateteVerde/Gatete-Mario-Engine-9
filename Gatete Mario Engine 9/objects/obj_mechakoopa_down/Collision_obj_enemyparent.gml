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
	
	//Turn into debris
	event_user(0);
	
	//Destroy
	instance_destroy();
}
