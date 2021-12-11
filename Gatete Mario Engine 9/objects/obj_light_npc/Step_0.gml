/// @description NPC light logic

if (!instance_exists(parent))
	instance_destroy();

//Otherwise
else {

	//Stay in position
	x = (parent.bbox_left + parent.bbox_right) / 2;
	y = (parent.bbox_top + parent.bbox_bottom) / 2;
	
	//Adjust radius if it changes
	if (radius != new_radius)
		radius = lerp(radius, new_radius, 0.0325);
}