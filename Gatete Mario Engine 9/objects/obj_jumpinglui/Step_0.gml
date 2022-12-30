/// @description Jumping Lui

//Perform step event from obj_physicsparent
event_perform_object(obj_physicsparent, ev_step, 0);

//If there's no gravity
if (yadd == 0) {
	
	yspeed = -(5 - (swimming * 2.5));
	y--;
}