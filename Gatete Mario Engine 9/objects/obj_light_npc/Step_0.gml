/// @description NPC light logic

if (!instance_exists(parent))
	instance_destroy();

//Otherwise
else {

	x = (parent.bbox_left + parent.bbox_right) / 2;
	y = (parent.bbox_top + parent.bbox_bottom) / 2;
}