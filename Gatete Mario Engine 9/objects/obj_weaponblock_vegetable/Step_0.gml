/// @description Break with vegetables

//Inherit the parent event
event_inherited();

//Check for a vegetable
var veg = collision_rectangle(bbox_left-6, bbox_top-6, bbox_right+5, bbox_bottom+5, obj_carryparent, 1, 0)

//If there's a vegetable in position
if (veg)
&& (veg.held == 0)
&& (veg.yspeed >= 0) {
	
	//Break the block
	event_user(15);
	
	//Halve vegetable horizontal speed
	with (veg) {
		
		xspeed = xspeed / 2;
		yspeed = -4 + (swimming * 2);
		y--;
	}
}