/// @description Carryable POW Block logic

//If not held
if (held == false) {

	//Previous horizontal speed
	prevxspeed = xspeed;
	
	//Inherit event from parent
	event_inherited();
	
	//If kicked
	if (kicked == 1) {
		
		//Cancel bounces
		bounces = -1;
    
		//If the direction changes or the object makes contact with the ground
		if (yadd == 0)
		|| (xspeed != prevxspeed) 
		    event_user(0);
	}
}

//Cancel kick if held
if (held)
&& (kicked = true) {
	
	kicked = false;
	if (bounces < bounces_max)
		bounces = bounces_max;
}

//Make the semisolid snap into the item
if (instance_exists(mysolid)) {

	mysolid.x = x-8;
	mysolid.y = bbox_top + 2;
}