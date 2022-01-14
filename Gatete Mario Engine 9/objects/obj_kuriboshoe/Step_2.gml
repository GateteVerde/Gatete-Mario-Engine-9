/// @description Ridden Kuribo Shoe logic

//If the player exists
if (instance_exists(obj_mario)) {
	
	//Update flashing
	isflashing = obj_mario.isflashing;
		
	//Force dismount yoshi if you have tiny powerup
	if (global.powerup == cs_tiny) {
			
		event_user(1);
		exit;
	}

    //Snap to position
    x = obj_mario.x;
    y = obj_mario.y;
    
    //Force the player to be invisible, hold and spin jump
    with (obj_mario) {
    
        visible = 0;
        holding = 4;
        jumpstyle = 1;
    }
    
    //If the player is standing
    if (obj_mario.state == playerstate.idle)
        image_index = 0;
        
    //Otherwise, if the player is walking or the jugemu shoe is flying, animate.
    else if ((obj_mario.state == 1) || ((global.mountcolour = 3) && (flying == 1))) {
    
        if (flying)
            image_speed = 0.25;
        else
            image_speed = 0.15;
    }
        
    //Otherwise, use second image
    else
    image_index = 1;

    //If the player is on a Dossun shoe
    if (global.mountcolour == 2) {
    
        //If the player lands after a jump, stomp
        if (stateprev == 2) 
        && (obj_mario.state != playerstate.jump)
        && (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_quicksand, 0, 0))
            instance_create_depth(x, y, -6, obj_stomp);
        
        //Remember last state
        stateprev = obj_mario.state;
    }
    
    //If the player is on a Jugemu shoe
    if (global.mountcolour == 3) {
    
        //If 'Shift' is being held outside water
        if ((input_check(input.action_0)) && (obj_mario.swimming == false)) {
        
            //If not flying and moving down, start flying.
            if (!flying)
            && (obj_mario.yspeed > 0) {
            
                flying = 1;
                alarm[0] = 1;
            }
            
            //When flying
            if (flying) {
            
                //With the player
                with (obj_mario) {
                
                    //If there's not a ceiling above the player, move up
                    if (!collision_rectangle(bbox_left, bbox_top-3, bbox_right, bbox_top, obj_solid, 1, 0)) {
                    
                        yspeed += -0.5;
                        if (yspeed < -1.5)
                            yspeed = -1.5;
                    }
                }
            }        
        }
        
        //Otherwise, stop flying
        else
            flying = false;
    }
    
    //Set depth
    depth = -5;
}

//Otherwise, if the player does not exist.
else {

    //Find a suitable player
    follow_which_mario();
    
    //If said player object exists, follow him
    if (instance_exists(follow)) {
    
        //Snap onto this object
        x = follow.x;
        y = follow.y;
        
        //Set the same depth as the other object
        depth = follow.depth;
    }
}

//If the player just died, destroy
if (instance_exists(obj_mario_dead))
    instance_destroy();