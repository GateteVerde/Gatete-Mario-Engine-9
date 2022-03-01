/// @description Holdable Enemy NPC logic (when held)

//Inherit 'obj_holdparent' End Step event
event_perform_object(obj_holdparent, ev_step, ev_step_end);

//Hereby horizontal speed
if (held)
&& (instance_exists(obj_mario))
	xspeed = obj_mario.xspeed;