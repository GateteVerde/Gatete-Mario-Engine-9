/// @description Custom death event

//Inherit the parent event
event_inherited();

//If Mario is doing a groundpound
if (killer_id == obj_mario)
&& (obj_mario.groundpound == 2) {

	#region COMBO
					
		//200
		if (other.hitcombo == 0) 
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				value = 200;
						
		//400
		else if (other.hitcombo == 1)
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				value = 400;
				        
		//800
		else if (other.hitcombo == 2)
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				value = 800;
				        
		//1000
		else if (other.hitcombo == 3)
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				value = 1000;
				        
		//2000
		else if (other.hitcombo == 4)
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				value = 2000;
				        
		//4000
		else if (other.hitcombo == 5)
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				value = 4000;
				        
		//8000
		else if (other.hitcombo == 6)
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				value = 8000;
				        
		//1-UP
		else if (other.hitcombo > 6)
			with (instance_create_depth(round(bbox_left + bbox_right) / 2, y, -6, obj_score))
				value = -1;
	#endregion
                    
    //Increment combo
    obj_mario.hitcombo++;
}
