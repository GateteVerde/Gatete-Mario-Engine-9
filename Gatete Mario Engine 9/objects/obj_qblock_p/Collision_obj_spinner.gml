/// @description Bump with spin attack

//If the block is visible
if (visible == true) {

	if (ready == 0) 
	&& (other.bump == false) {
	
		//Make spinner unable to bump
		other.bump = true;

		//Set state to bumped
		ready = 1;
						
		//Set horizontal speed
		vspeed = -2;
		alarm[0] = 4;
						
		//Create block specific events
		event_user(0);	
	}
}