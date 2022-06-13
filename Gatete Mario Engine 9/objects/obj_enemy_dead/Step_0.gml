/// @description Dead enemy logic

//Quicksand collision
var qs = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_quicksand, 0, 0);
if (qs) {

	//Set up depth
	depth = 150;
	
	//If moving up, stop
	if (vspeed < 0)
		vspeed = 0;
		
	//Otherwise
	else if (vspeed > 0) {
	
		gravity = 0.03;
		if (vspeed > 0.1)
			vspeed = 0.1;
	}
}

//Gravity
gravity = (swimming) ? 0.03125 : 0.25;

//Cap vertical speed
vspeed = (swimming) ? min(2, vspeed) : min(4, vspeed);

//If moving down
if (vspeed > 0) {

	//Destroy when outside the view
	if (outside_view() == true)
	&& (y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))
		instance_destroy();
}

//Water collision
var wt = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0);
if (wt)
&& (wt.object_index != obj_waterfall)
	swimming = true;
else
	swimming = false;