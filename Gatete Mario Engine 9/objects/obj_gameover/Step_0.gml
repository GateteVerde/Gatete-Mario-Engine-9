/// @description Game over logic

//Manage position of Mario
if (y >= ystart) {

	//If the falling speed is greater than 0.01
	if (vspeed < 0.5) {
		
		vspeed = 0;
		gravity = 0;
	}
	else {
		
		y--;
		vspeed = -vspeed/2;
	}
}

//Cap vertical speed
if (vspeed > 6)
	vspeed = 6;