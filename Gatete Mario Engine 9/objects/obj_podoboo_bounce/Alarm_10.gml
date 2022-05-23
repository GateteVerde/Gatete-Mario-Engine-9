/// @description Move towards the player

//If Mario does not exist or it's at the left
if (!instance_exists(obj_mario)) || (obj_mario.x < x) {
	
	//Move to the left
	xspeed = -1
	
	//If Mario is above...
	if (obj_mario.y < y)
		yspeed = -1;
	else
		yspeed = 1;
}
else {
	
	//Move to the right
	xspeed = 1;
	
	//If Mario is above...
	if (obj_mario.y < y)
		yspeed = -1;
	else
		yspeed = 1;
}
