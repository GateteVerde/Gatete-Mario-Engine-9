/// @description Manage movement

//Custom movement variables
x += xspeed;
y += yspeed;

//No gravity
yadd = 0;

//Do not move if the 'quiet' flag is set to on
if (quiet == true) {

	xspeed = 0;
	if (freeze == false)
		yspeed += (y > ystart) ? -0.05 : 0.05;
}

//Otherwise
else {

	//Manage yspeed if not frozen
	if (freeze == false) {

		time = time+1;
		y -= 0.075;
		yspeed = -cos(time / 32) * 0.75;
	}
}