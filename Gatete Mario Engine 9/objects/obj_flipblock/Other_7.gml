/// @description Stop flipping when there's no more spins left

if (spins > 0)
	spins--;
else {

	//If Mario is not overlapping this block
	if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mario, 0, 0))
		spins++;
	else
		event_perform(ev_create, 0);
}