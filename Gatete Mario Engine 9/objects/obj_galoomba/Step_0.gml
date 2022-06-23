/// @description Galoomba logic

//Inherit the parent event
event_inherited();

//If this enemy came out from a bubble
if (bubble == 1) {

	//If there's no gravity
	if (yadd == 0) {
		
		bubble = 0;
		alarm[10] = 2;
	}
}

//Set the facing direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;