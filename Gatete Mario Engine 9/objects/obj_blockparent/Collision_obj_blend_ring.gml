/// @description Bump with shockwave

if (ready == 0) {

	//Set state to bumped
	ready = 1;
						
	//Set horizontal speed
	vspeed = -2;
	alarm[0] = 4;
						
	//Create block specific events
	event_user(0);	
}