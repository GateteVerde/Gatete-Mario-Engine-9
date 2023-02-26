/// @description Start jumping

//If there's no gravity
if (yadd == 0) {

	//Start jumping
	jumping = 1;
    
	//Set the vertical speed
	yspeed = (swimming == true) ? -0.75 : -1.5;
	y--;
}
else
	alarm[0] = 10;