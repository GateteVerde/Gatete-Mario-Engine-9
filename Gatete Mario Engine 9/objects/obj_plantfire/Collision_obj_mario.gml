/// @description Hurt / Freeze Mario

//If this is a fire ball
if (sprite_index == spr_fireball)
	with (other) event_user(0);
	
//Otherwise, if this is a ice ball
else if (sprite_index == spr_iceball)
	event_perform_object(obj_icebro_iceball, ev_collision, obj_mario);
