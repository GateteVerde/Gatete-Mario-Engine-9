/// @description Buoy Platform Logic (Player)

//Inherit the parent event
event_inherited();

//Check for the player
var mario = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0);

//If the player exists
if (mario)
&& (mario.state != playerstate.jump)
&& (mario.bbox_bottom < yprevious+5) {
	
	//If the platform is not sinking
	if (sink == 0) {
	
		//Sink it
		sink = 1;
		vspeed = 2;
	}
}
else {

	if (sink > 0)
		sink = 0;
}