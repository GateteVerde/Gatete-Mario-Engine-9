/// @description Yellow Parakoopa logic

//Inherit the parent event
event_inherited();

//Keep following the player
if (yadd == 0) && (jumping == 0) {
        
    //Check for a kicked shell
    var mshell = collision_rectangle(x+(16*sign(xscale)), bbox_top, x+(24*sign(xscale)), bbox_bottom-4, obj_shell_kicked, 0, 0);
            
    //If there's a shell in position and said shell does not have a koopa inside.
    if (mshell) 
    && (mshell.xspeed != xspeed) {
		
		//Set sprite
		sprite_index = spr_parakoopa_yellow_jump;
            
        //Set the vertical speed
		yspeed = (swimming) ? -2 : -4;
		
		//Jump
		jumping = 1;
                    
        //Boost jump
        y--;
    }
}

//Otherwise, reset jump
else if ((jumping == 1) && (yadd == 0)) {
	
	jumping = 0;
	if (sprite_index != spr_parakoopa_yellow)
		sprite_index = spr_parakoopa_yellow;
}