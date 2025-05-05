/// @description Toggle movement when crouched down

//If the player is crouched down or groundpounding)
if (crouch == true) {

    //If the player is inside a shoe, allow move
    if (global.mount == 2)
        move = true;
        
    //Otherwise...
    else 
		move = (state == playerstate.jump) ? true : false;
}

//Otherwise, allow movement
else {
	
	//If Mario is riding a cloud, disable movement
	if (oncloud == true)
		move = false
		
	//Otherwise
	else
		move = (groundpound == 0) ? true : false;
}
