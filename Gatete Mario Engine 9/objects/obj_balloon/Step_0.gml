/// @description Manage movement

//Custom movement variables
x += xspeed;
y += yspeed;

//No gravity
yadd = 0;

//Manage yspeed if not frozen
if (freeze == false) {

	time = time+1;
	y -= 0.075;
	yspeed = -cos(time / 32) * 0.75;
}