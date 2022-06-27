/// @description Coin carousel logic

//If the coins are moving
if (active == true) {

    //Check if the player is above the coins.
    for (i=0; i<amount; i++;) {
		
		if (instance_exists(coin[i])) {
        
	        //Set the position of the coin.
	        coin[i].x = x+distance*cos((angle+(i*360/amount))*pi/180);
	        coin[i].y = y-distance*sin((angle+(i*360/amount))*pi/180);
		}
    }
}

//Do not move if Mario is dead or transforming
if (!instance_exists(obj_mario_dead))
&& (!instance_exists(obj_mario_transform)) {

	angle += spd*(clockwise*-1);
	if (angle > 360)
	    angle -= 360;
}