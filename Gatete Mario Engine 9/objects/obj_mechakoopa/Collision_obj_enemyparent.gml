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
	
	//Kill this enemy
	for (var i=0; i<5; i++) {

	    with (instance_create_depth(x, y, -6, obj_mechakoopa_debris)) {
    
			sprite_index = other.debris_sprite;
	        hspeed = random_range(-1.5, 1.5);
	        vspeed = random_range(-3, -1);
	        image_speed = 0;
	        image_index = i;
	    }
	}
	
	//Destroy
	instance_destroy();
}
