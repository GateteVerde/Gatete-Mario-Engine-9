/// @description Fireball logic

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
	yadd = 0.25;

//Prevent getting embed on slopes
while (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_slopeparent, 1, 0)) y -= 4;

//Destroy if horizontal speed is not the same as prevxspeed
if (sign(xspeed) != sign(prevxspeed))
	event_user(0);
