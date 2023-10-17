/// @description Prevent from getting embed on solids

//Destroy if there's no ground below
if (!place_meeting(x + 8, bbox_bottom, obj_semisolid))
&& (!place_meeting(x + 8, bbox_bottom, obj_slopeparent)) {

	instance_destroy();
	exit;
}

//Push upwards if on ground
while (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom, obj_semisolid, 0, 0))
|| (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom, obj_slopeparent, 1, 0))
	y--;