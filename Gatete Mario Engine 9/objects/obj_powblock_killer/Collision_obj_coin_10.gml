/// @description Apply gravity onto 10, 30 and 50 Coins

if (other.ready == 0) {
	
	//Apply physics
	other.ready = 1;
	
	//Blink and destroy
	other.alarm[0] = 480;
	other.alarm[1] = 600;
	
	//Set horizontal speed
	if (other.xspeed == 0)
		other.xspeed = random_range(-1, 1);
}