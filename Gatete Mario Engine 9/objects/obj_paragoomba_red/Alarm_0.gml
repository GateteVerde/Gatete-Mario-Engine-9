/// @description Start jumping

//If the goomba is on the ground
if (yadd == 0) {

    //Start jumping
    jumping = 1;
    
	//Set the vertical speed
	yspeed = (swimming) ? -0.75 : -1.5;
}

//Otherwise, wait
else
    alarm[0] = 10;