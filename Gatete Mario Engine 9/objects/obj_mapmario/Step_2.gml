/// @description Manage animation

//If climbing
if (is_climbing) {
	
	//Set up the sprite
	sprite_index = spr_mapmario_climb;
	
	//Set up the yoshi sprite
	yoshi_index = spr_mapmario_yoshi_up;
    
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
			sprite_index = spr_mapmario_select;
			
			//Set up the yoshi sprite
			yoshi_index = spr_mapmario_yoshi;
		}
		else {
			
			//Set the sprite
			sprite_index = spr_mapmario;
			
			//Set up the yoshi sprite
			yoshi_index = spr_mapmario_yoshi;
		}
    }
        
    //Otherwise, if moving up
    else if (direct == 90) {
        
		//Set up the sprite
		sprite_index = spr_mapmario_up;
	
		//Set up the yoshi sprite
		yoshi_index = spr_mapmario_yoshi_up;
        
        //Reset scale
        if (xscale != 1)
            xscale = 1;
    }
            
    //Otherwise, if moving to the side
    else {
            
		//Set up the sprite
		sprite_index = spr_mapmario_side;
	
		//Set up the yoshi sprite
		yoshi_index = spr_mapmario_yoshi_side;
            
        //Set the scale
        if (direct == 0)
            xscale = 1;
        else
            xscale = -1;
    }
}