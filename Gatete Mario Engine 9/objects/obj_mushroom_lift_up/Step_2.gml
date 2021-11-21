/// @description Mushroom Lift logic

//Inherit the parent event
event_inherited();

//Check for Mario
var mario = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0);

//If Mario is on this platform
if (mario)
&& (mario.state < playerstate.jump)
&& (mario.bbox_bottom < yprevious+5) {

	//If the mushroom is not at the limit, make it rise
	if (y > (ystart - y_max))
		vspeed -= 0.25;
		
	//Otherwise, stop it
	else {
		
		y = ystart - y_max;
		if (vspeed < 0)
			vspeed = 0;
	}
}

//Otherwise, make it contract
else {

	//Set the vertical speed
	vspeed += 0.25;
	
	//If the platform is at the start position, stop contracting
	if (y > ystart) {

		y = ystart;
		if (vspeed > 0)
			vspeed = 0;
	}
}

//Cap vertical speed
if (vspeed < -2)
	vspeed = -2;
else if (vspeed > 2)
	vspeed = 2;