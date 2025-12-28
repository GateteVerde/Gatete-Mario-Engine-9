/// @description Default hurt script

//Exit if the boom-boom is on the defeat state
if (sprite_index == spr_boomboom_defeat) {

	with (other) event_user(0);
	exit;
}

//If not ready
if (ready == 0) {

    //Stop horizontal speed
    xspeed = 0;

    //If boom-boom has only one hp left
    if (hp == 1) {
    
        //Set defeat sprite
        sprite_index = spr_boomboom_defeat;
		
		//Set vulnerability
		vulnerable = 100;
        
        //Get 4000 points
        with (instance_create_depth(round(bbox_left+bbox_right)/2, bbox_top, -6, obj_score)) value = 4000;
        
        //Explode
        alarm[0] = 120;
    }
    
    //Otherwise, decrement hitpoints
    else {
    
        //Set hurt sprite
        sprite_index = spr_boomboom_damage;
        
        //Get 1000 / 2000 points
        if (hp == 3) {
        
            hp = 2;
            increment = 1.5;
            with (instance_create_depth(round(bbox_left+bbox_right)/2, bbox_top, -6, obj_score))
                value = 1000;
        }
        else {
        
            hp = 1;
            increment = 2;
            with (instance_create_depth(round(bbox_left+bbox_right)/2, bbox_top, -6, obj_score))
                value = 2000;            
        }
        
        //Return to normal
        alarm[2] = 60;
    }
    
    //Prevent getting stomped
    ready = 1;
    
    //Animate
    image_speed = 1;
    
    //Reset alarms
    alarm[1] = -1;
    alarm[9] = -1;
    alarm[10] = -1;
    alarm[11] = -1;
        
    //Set vulnerability
    stomp = -1;
}