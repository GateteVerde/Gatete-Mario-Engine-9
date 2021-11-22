/// @description Hurt Mario

//Check for Mario
var mario = collision_rectangle(bbox_left - 1, bbox_top - 2, bbox_right + 1, bbox_bottom + 2, obj_mario, 0, 0);

//If Mario is on this platform
if (mario)
	with (mario) event_user(0);