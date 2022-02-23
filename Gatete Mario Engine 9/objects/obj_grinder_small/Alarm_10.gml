/// @description Start moving

//Check for a track
var track = collision_rectangle(x+xorig, y+yorig-3, x+xorig, y+yorig+0.9, obj_trackparent, 1, 0);

//If there's no track
if (!track) {
	
	//Set 'Falling' state
	state = "FALLING";
	
	//Allow to hang in tracks
	ready = 1;
	
	//If Mario does not exist or it's at the left
	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
		hspeed = -2;
	else
		hspeed = 2;
}

//Otherwise
else {

	//Set 'In_Line' state
	state = "IN_LINE";
	
	//Already hangin' in a track
	ready = 0;
	
	//If Mario does not exist or it's at the left
	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
		direct = 180;
	else
		direct = 0;
}