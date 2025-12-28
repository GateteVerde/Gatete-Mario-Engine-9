/// @description Dead enemy logic

//Gravity
gravity = (swimming) ? 0.03125 : 0.25;

//Horizontal speed
if (fling == 1) {

	hspeed = clamp(hspeed, -0.5, 0.5);
}

//Lava
var lava = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_lava, 0, 0);
if (lava) {

	//If depth is not 150
	if (depth != 150) {
	
		//Set depth
		depth = 150;
		
		//Create lava splash
		with (instance_create_depth(x, lava.y-7, -6, obj_smoke))
			sprite_index = spr_splash_lava;
	}
	
	//Stop horizontal speed
	hspeed = 0;
	
	//Sink slowly
	if (vspeed > 0.25)
		vspeed = 0.25;
}

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

//If moving down
if (vspeed > 0) {
	
	//Clamp vertical speed
	vspeed = (swimming) ? min(vspeed, 1) : min(vspeed, 4);

	//Destroy when outside the view
	if (outside_view() == true)
	&& (y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))
		instance_destroy();
}

//Angle
angle += 8 * sign(hspeed)*-1;
angle = clamp(angle, -180, 180)

//Water collision
var wt = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0);
if (wt)
&& (wt.object_index != obj_waterfall)
	swimming = true;
else
	swimming = false;