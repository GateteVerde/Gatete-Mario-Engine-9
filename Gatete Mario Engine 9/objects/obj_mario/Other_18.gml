/// @description Toggle movement when crouched down

//If the player is crouched down or groundpounding)
if (crouch == true) {

    //If the player is inside a shoe, allow move
    if (global.mount == 2)
        move = true;
        
    //Otherwise...
    else {

		//If the player is in the air, allow movement
        if (state == playerstate.jump)
            move = true;
       
		//Otherwise, disallow movement
        else
            move = false;    
    }
}

//Otherwise, allow movement
else {
	
	//If Mario is riding a cloud, disable movement
	if (oncloud == true)
		move = false
		
	//Otherwise
	else {
	
		//If Mario is not doing a groundpound
		if (groundpound == 0)
			move = true;
		else
			move = false;
	}
}
