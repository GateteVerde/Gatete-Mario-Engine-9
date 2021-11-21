/// @description Make the platform move to the right

//If the player does not exist...
if (!instance_exists(obj_mario))
exit;

//...or the player is in the bolt lift, exit.
if (place_meeting(x, y, obj_mario))
exit;

//If Mario's gravity is equal to 0
if (obj_mario.yadd == 0)
&& (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_mario_marker_bottom, 1, 0)) {

	//If there's not a wall to the right
	if (!touchwall_r) {
	
		//Animate it
		image_speed = 0.5;
		
		//Let spin
		isspin = 1;
		
		//Move it to the right and stop it after 1/2 seconds
		hspeed = 0.25;
		alarm[0] = 60;
	}
}