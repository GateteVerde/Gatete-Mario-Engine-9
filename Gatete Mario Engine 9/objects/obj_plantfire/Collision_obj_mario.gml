/// @description Hurt / Freeze Mario

//If this is a ice ball
if (sprite_index == spr_iceball)
	event_perform_object(obj_icebro_iceball, ev_collision, obj_mario);
	
//Otherwise
else
	with (other) event_user(0);