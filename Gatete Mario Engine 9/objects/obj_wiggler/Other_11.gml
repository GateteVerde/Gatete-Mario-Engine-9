/// @description Wiggler stomp

//If wiggler is not angry
if (state == 0) {

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
    
    //Kill flower
    with (instance_create_depth(x, y, -6, obj_enemy_dead)) {
    
        sprite_index = spr_wiggler_flower;
        image_xscale = other.xscale;
    }
        
    //Stop movement
    xspeed = 0;
    
    //Stunned state
    state = 1;
    
    //New length for body parts
    closeness = 8;
    
    //Sprite
    sprite_index = spr_wiggler_mad;
    
    //Stop animation
    image_speed = 0;
    
    //Update length and sprite
    for (i = 1; i < seg; i++)  {
    
        mybody[i].x = oldx[i*closeness];
        mybody[i].y = oldy[i*closeness];
        mybody[i].image_speed = 0;
        mybody[i].sprite_index = spr_wiggler_mad_body;
    }
    
    //Reset coodirnate values
    amount_previous = 85;
    
    //Cycle between palettes
    alarm[1] = 1;
    
    //Go after the player
    alarm[0] = 65;
}
