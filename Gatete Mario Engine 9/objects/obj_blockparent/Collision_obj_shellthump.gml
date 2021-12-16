/// @description Bump with spin attack

if (ready == 0) 
&& (other.bump == true) {
	
	//Make spinner unable to bump
	other.bump = false;

	//Set state to bumped
	ready = 1;
	event_user(0);
						
	//Set horizontal speed
	alarm[0] = 4;
	if (other.x < x + sprite_width / 2)
		hspeed = 2;
	else
		hspeed = -2;
}