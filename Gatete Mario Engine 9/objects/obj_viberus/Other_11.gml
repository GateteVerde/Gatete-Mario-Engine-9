/// @description Gladrus stomp event

//If the gladrus is not angry
if (charge == 0) && (squishy == 0) {

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
    
    //Squish walrus
    squishy = 1;
    image_speed = 0;
    image_index = 0;
    
    //Set scale
    fxs = 1.5;
    fys = 0.5;
    
    //Stop movement
    xspeed = 0;
}