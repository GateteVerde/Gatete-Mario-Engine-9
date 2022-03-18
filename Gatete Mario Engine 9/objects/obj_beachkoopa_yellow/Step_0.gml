/// @description Beach Koopa logic

//Inherit event from parent
event_inherited();

//Deny swimming if jumping
if (jumping == 1)
    swimming = false;

//Sliding logic
if (ready == 0) {
    
    //Slow down
    if (yadd == 0) then xspeed = max(0,abs(xspeed)-0.05)*sign(xspeed);
    
    //If the koopa is about to stop
    if (xspeed < 0.05) 
    && (xspeed > -0.05) {
        
        //Stop it
        xspeed = 0;
        
        //Allow movement
        ready = 1;
        
        //Start moving
        alarm[10] = 90;
    }
}

//Otherwise, check for shells
else if (ready > 0) {

    //If the koopa just came out from the shell, do not allow it to enter.
    if (sprite_index == spr_beachkoopa_walk)
    && (ready == 1)
    && (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom-4, obj_shell, 0, 0))
        ready = 2;
        
    //Otherwise if the koopa is no longer overlapping a shell, make him enter one.
    else if (ready == 2) {
		
		//Keep following the player
        if ((yadd == 0) && (ready > 1)) {
        
            //Check for a kicked shell
            var mshell = collision_rectangle(x+(16*sign(xscale)), bbox_top, x+(24*sign(xscale)), bbox_bottom-4, obj_shell_kicked, 0, 0);
            
            //If there's a shell in position and said shell does not have a koopa inside.
            if (mshell) 
            && (mshell.xspeed != xspeed) {
            
                //Set the vertical speed
				yspeed = (swimming) ? -2 : -4;
                    
                //Boost jump
                y--;
            }
        }
    
        //Check for a shell
        var shell = collision_rectangle(x+(5*sign(xscale)), bbox_top, x+(8*sign(xscale)), bbox_bottom-4, obj_shell, 0, 0);
        
        //If there's a shell in position and said shell does not have a koopa inside.
        if (shell) 
        && (shell.held == 0)
        && (shell.sprite_height < 17) {
        
            //If there's not a koopa inside the shell
            if (shell.koopainside == 0) 
            && (jumping == 0) {
            
                //Make the beach koopa jump
                jumping = 1;
                
                //Boost jump
                y--;
                
                //Set the vertical speed
                yspeed = -2.5;
            }
            
            //Otherwise, turn around
            else if (shell.koopainside != 0)
                xspeed = -xspeed;
        } 
        
        //Reset jump
        if (jumping == 1)
        && (yadd == 0)
		&& (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_shell, 0, 0))
            jumping = 0;         
    }
}

//Manage collision with solid
turn_toward = (ready < 1) ? 0 : 1;

//Set facing direction
if (xspeed > 0)
    xscale = 1;
else if (xspeed < 0)
    xscale = -1;