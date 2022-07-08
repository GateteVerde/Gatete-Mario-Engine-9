/// @description Destroy when invisible

//Set facing direction
xscale = 1 * sign(hspeed);

//Decrement alpha
alpha -= 0.025;
if (alpha < 0.025)
	instance_destroy();