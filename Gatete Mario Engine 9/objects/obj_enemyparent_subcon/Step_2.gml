/// @description Moving Platform logic

//Make sure the semisolid follows
if (instance_exists(mytop)) {
        
    mytop.x = x;
    mytop.y = (instance_exists(obj_invincibility)) ? -1000 : bbox_top;
	
	//If the enemy is pullable 
    if (isheavy < 2) {
        
        //If the pull object does not exist and this object can be pulled
		if (can_carry() == true)
        && (instance_number(obj_mario_puller) == 0) 
		&& (collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0)) {
            
            //Force Mario to hold the enemy
            with (obj_mario) {
                
                holding = 1;
                visible = 0;
            }
                
            //Create puller
            instance_create_depth(obj_mario.x, obj_mario.y, -5, obj_mario_puller);
                
            //Finish pull
            if (isheavy == 0) {

				play_voiceline(global.voiceline_pull, 0, false); 
                alarm[0] = 10;
			}
            else {
				
				play_voiceline(global.voiceline_pull_hard, 0, false);
                alarm[0] = 20;
			}
        }
    }
	
	//If Mario does exist
	if (instance_exists(obj_mario)) {
	
		//Check for a semisolid
		var check = collision_rectangle(obj_mario.bbox_left, obj_mario.bbox_bottom-1, obj_mario.bbox_right, obj_mario.bbox_bottom+2, obj_semisolid, 0, 0);
		if (check)
		&& (check != obj_solid)
			exit;
        
	    //If the player is on this moving platform
	    if (collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0))
	    && (obj_mario.bbox_bottom < yprevious+5)
	    && (obj_mario.state < 2) {
        
	        //Snap the player vertically
	        obj_mario.y = ceil(bbox_top-16);
        
	        //Move the player horizontally if there is no solid in his way
	        if (xspeed < 0) && (!collision_rectangle(obj_mario.bbox_left+xspeed, obj_mario.bbox_top+4, obj_mario.bbox_left, obj_mario.bbox_bottom-1, obj_solid, 0, 0))
	        || (xspeed > 0) && (!collision_rectangle(obj_mario.bbox_right, obj_mario.bbox_top+4, obj_mario.bbox_right+xspeed, obj_mario.bbox_bottom-1, obj_solid, 0, 0))
	            obj_mario.x += xspeed;
	    }
	}
}
