/// @function ai_npc_destroy()

function ai_npc_destroy() {
	
	//Remove every NPC on screen
	with (obj_physicsparent) {

	    //Do this only if inside the view
	    if (outside_view() == false) {
    
	        //If the object is ancestor of either holdparent, enemyparent or powerup parent
	        if (object_is_ancestor(object_index, obj_holdparent))
	        || (object_is_ancestor(object_index, obj_enemyparent))
	        || (object_is_ancestor(object_index, obj_powerupparent)) {
        
	            //Create poof of smoke
	            instance_create_depth(round(bbox_left+bbox_right)/2, round(bbox_top+bbox_bottom)/2, -2, obj_smoke);
				
				//Do not create a coin if any of these items exists
				if (object_index != obj_wiggler_body) 
				&& (object_index != obj_firesnake_body) {
					
					instance_create_depth(round(bbox_left+bbox_right)/2, bbox_top, -2, obj_block_coin_goal);
				}

	            //Destroy
	            instance_destroy();
	        }
	    }
	}
}
