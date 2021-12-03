/// @description Destroy when in contact with a solid or when there's no water above

//If this bubble is not ridden yet and this one collides with a solid
if (ison == 0) {
	
	//If the bubble goes outside the view
	if (outside_view())
		instance_destroy();
		
	//Otherwise, if this bubble collides with a solid
	else if (place_meeting(x, y-1, obj_solid))
		event_user(0);
}
	
//Otherwise
else if (ison == 1) {

	//If Mario does not longer exist
	if (global.powerup == cs_mega)
	|| (instance_number(obj_mario) == 0) {
	
		instance_destroy();
		exit;
	}
	
	//Snap bubble on Mario's position
	x = obj_mario.x;
	y = obj_mario.y+4;
	
	//If this bubble collides with water, destroy it
	swim = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_swim, 0, 1);
	if (swim)
	&& (swim.object_index != obj_hippo_bubble)
		event_user(0);
}

//Decrement delay
if (delay > 0)
	delay--;