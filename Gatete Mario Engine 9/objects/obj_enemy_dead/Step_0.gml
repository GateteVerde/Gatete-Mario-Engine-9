/// @description Dead enemy logic

#region ANGLE

	//Do not spin with the following sprites
	if (sprite_index != spr_pokey)
	&& (sprite_index != spr_firesnake)
	&& (sprite_index != spr_firesnake_body) 
	&& (sprite_index != spr_wiggler)
	&& (sprite_index != spr_wiggler_body)
	&& (sprite_index != spr_wiggler_mad)
	&& (sprite_index != spr_wiggler_mad_body)
	&& (sprite_index != spr_wiggler_flower) 
	&& (sprite_index != spr_flamechomp) 
	&& (sprite_index != spr_fireball) 
	&& (sprite_index != spr_banzaibill) 
	&& (sprite_index != spr_bullseyebill) {

		//Set up angle
		angle += 10*sign(hspeed);
		if (abs(angle) > 360) {
		
			angle = 0;
		}
	}

	//Otherwise
	else {

		if (sprite_index != spr_banzaibill)
		&& (sprite_index != spr_bullseyebill)
			angle = 180;
	}
#endregion

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