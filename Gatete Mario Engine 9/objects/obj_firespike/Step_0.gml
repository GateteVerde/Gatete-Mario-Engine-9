/// @description Fire Spike logic

//Inherit the parent event
event_inherited();

//If the spike does not move
if (quiet == 1) {

    //If Mario does not exist or is at the left
    if (!instance_exists(obj_mario))
    || (obj_mario.x < x)
        xscale = -1;
    else
        xscale = 1;
}
else {

	//Face towards direction
	if (xspeed > 0)
		xscale = 1;
	else if (xspeed < 0)
		xscale = -1;
}