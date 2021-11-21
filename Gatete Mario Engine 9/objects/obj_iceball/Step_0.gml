/// @description Snowball logic

//Check previous horizontal speed
prevxspeed = xspeed;

//No swimming
swimming = false;

//Inherit the parent event
event_inherited();

//If there's no gravity, bounce
if (yadd == 0) {

	yspeed = -2.5;
	yadd = 0;
}
else
	yadd = 0.125;

//Destroy if horizontal speed is not the same as prevxspeed
if (sign(xspeed) != sign(prevxspeed))
	event_user(0);
