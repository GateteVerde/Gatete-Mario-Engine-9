/// @description Custom Stomp script

//If the Rollippo is not rolling
if (ready == 0) {

	#region COMBO
					
		//200
		if (obj_mario.hitcombo == 0) 
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				value = 200;
						
		//400
		else if (obj_mario.hitcombo == 1)
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				value = 400;
				        
		//800
		else if (obj_mario.hitcombo == 2)
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				value = 800;
				        
		//1000
		else if (obj_mario.hitcombo == 3)
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				value = 1000;
				        
		//2000
		else if (obj_mario.hitcombo == 4)
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				value = 2000;
				        
		//4000
		else if (obj_mario.hitcombo == 5)
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				value = 4000;
				        
		//8000
		else if (obj_mario.hitcombo == 6)
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				value = 8000;
				        
		//1-UP
		else if (obj_mario.hitcombo > 6)
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				value = -1;
	#endregion
                    
    //Increment combo
    obj_mario.hitcombo++;
            
    //Rolling state
    ready = 1;
	
	//No longer turn on ledges
	turn_on_ledges = false;
    
    //Sprite
    sprite_index = spr_rollippo_roll;
    
    //Stop animation
    image_speed = 0;
}

//Double movement speed
xspeed = (obj_mario.x < x) ? 2.5 : -2.5;

//Do a little hop
yspeed = -2.5;