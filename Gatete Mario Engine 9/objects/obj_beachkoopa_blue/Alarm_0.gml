/// @description Slide if above a slope

//If this enemy has been kicked out from a shell
if (sprite_index == spr_beachkoopa_blue)
exit;

//Check for a slope
if (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, obj_slopeparent, 1, 0)) {

	//Start sliding
	slide = true;
	
	//Set sliding sprite
	sprite_index = spr_beachkoopa_blue_b;
	
	//Do not animate
	image_speed = 0;
	image_index = 0;
	
	//Stop horizontal movement
	xspeed = 0;
}