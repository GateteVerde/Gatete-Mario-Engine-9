/// @description Rocky Wrench logic

//If the object is frozen, do not move
if (freeze == true)
exit;

//If the piranha plant is coming out
if (ready == 1) {

	y -= 0.5;
	if (y < ystart-16) {
	
		//Snap in position
		y = ystart-16;
		
		//Come in
		ready = 2;
		alarm[0] = 120;
		alarm[1] = 60;
	}
}

//Otherwise, if the piranha plant is going inside
else if (ready == 3) {

	y += 0.5;
	if (y > ystart) {
		
		//Snap in position
		y = ystart;
	
		//Come out
		ready = 0;
		alarm[0] = 60;
	}
}

//Change facing direction and stomp value
if (instance_exists(obj_mario)) {
	
	//Change stomp value
	stomp = (obj_mario.state == 2) ? 0 : 3;
	
	//Change semisolid
	mytop.y = (obj_mario.state == 2) ? y : -1000;
	
	//Face towards Mario
	if (obj_mario.x > x)
		xscale = 1;
	else
		xscale = -1;
}
else
	stomp = 3;