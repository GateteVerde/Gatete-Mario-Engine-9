/// @description Manage animation

//If climbing
if (is_climbing) {
	
	//Set up the sprite
	sprite_index = global.map_climb_sprite;
	
	//Set up the yoshi sprite
	yoshi_index = global.map_yoshi_up_sprite;
    
    //Set up the scale
	if (xscale != 1)
		xscale = 1;
}
    
//Otherwise, if not climbing
else {
    
    //If moving down or stopped
    if (direct == 270)
    || (status == mapstate.idle) {
		
		//Reset scale
        xscale = 1;
        
        //If a stage has been selected
		if (is_ready == 1) {
			
			//Set the sprite
			sprite_index = global.map_select_sprite;
			
			//Set up the yoshi sprite
			yoshi_index = global.map_yoshi_sprite;
		}
		else {
			
			//Set the sprite
			sprite_index = global.map_sprite;
			
			//Set up the yoshi sprite
			yoshi_index = global.map_yoshi_sprite;
		}
    }
        
    //Otherwise, if moving up
    else if (direct == 90) {
        
		//Set up the sprite
		sprite_index = global.map_up_sprite;
	
		//Set up the yoshi sprite
		yoshi_index = global.map_yoshi_up_sprite;
        
        //Reset scale
        if (xscale != 1)
            xscale = 1;
    }
            
    //Otherwise, if moving to the side
    else {
            
		//Set up the sprite
		sprite_index = global.map_side_sprite;
	
		//Set up the yoshi sprite
		yoshi_index = global.map_yoshi_side_sprite;
            
        //Set the scale
        if (direct == 0)
            xscale = 1;
        else
            xscale = -1;
    }
}