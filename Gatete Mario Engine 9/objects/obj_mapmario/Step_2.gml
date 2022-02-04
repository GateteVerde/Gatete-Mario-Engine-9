/// @description Manage animation

//If climbing
if (is_climbing) {
	
	//Set up the sprite
	sprite_index = (global.mount == 1) ? spr_mapmario_yoshi_up : spr_mapmario_climb;
    
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
        
        //Set up the sprite
		if (is_ready == 1)
			sprite_index = (global.mount == 1) ? spr_mapmario_yoshi : spr_mapmario_select;
		else
			sprite_index = (global.mount == 1) ? spr_mapmario_yoshi : spr_mapmario;
    }
        
    //Otherwise, if moving up
    else if (direct == 90) {
        
        //Set up the sprite
        sprite_index = (global.mount == 1) ? spr_mapmario_yoshi_up : spr_mapmario_up;
        
        //Reset scale
        if (xscale != 1)
            xscale = 1;
    }
            
    //Otherwise, if moving to the side
    else {
            
        //Set up the sprite
        sprite_index = (global.mount == 1) ? spr_mapmario_yoshi_side : spr_mapmario_side;
            
        //Set the scale
        if (direct == 0)
            xscale = 1;
        else
            xscale = -1;
    }
}