/// @description Dead enemy logic

#region ANGLE

	//Angle
	if (sprite_width < 24)
	&& (sprite_height < 24)
		angle += 10 * sign(hspeed);
#endregion

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