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
            
	            //Destroy
	            instance_destroy();
	        }
	    }
	}
}
