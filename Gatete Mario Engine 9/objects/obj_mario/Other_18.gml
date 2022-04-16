/// @description Toggle movement when crouched down

//If the player is crouched down or groundpounding)
if (crouch == true) {

    //If the player is inside a shoe, allow move
    if (global.mount == 2)
        move = true;
        
    //Otherwise...
    else {

        if (state == playerstate.jump) { //If the player is jumping.
        
            //Allow the player's horizontal movement.
            move = true;
        }
        else { //Otherwise, disallow the player's movement.
        
            //Disallow the player's horizontal movement.
            move = false;    
        }
    }
}

//Otherwise, allow movement
else {
	
	if (groundpound == 0)
		move = true;
	else
		move = false;
}
