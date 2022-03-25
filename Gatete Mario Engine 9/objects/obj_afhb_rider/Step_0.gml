/// @description Amazing Flying Hammer Bro logic

//If the platform exists
if (instance_exists(parent)) {

	//Stay above the parent
	x = parent.x + 16;
	y = parent.y - 16;
	
    //Kill if the block has been bumped
    if (parent.block_offset_l < 0)
    || (parent.block_offset_r < 0) {
    
        //Play 'Kick' sound
		audio_play_sound(snd_kick, 0, false);
		
		//Kill NPC
		with (self) {
		
			killer_id = id;
			event_user(0);
		}
        
        //Create 'Spinthump' effect
        with (instance_create_depth(round(bbox_left + bbox_right) / 2, bbox_bottom, -4, obj_smoke)) sprite_index = spr_spinthump;
            
        //Get 800 points
        with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -4, obj_score)) 
            value = 800;   
    }
}