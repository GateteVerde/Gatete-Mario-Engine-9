/// @description Make it visible

if (sprite_index == spr_coin_outline) {
	
	//Turn into a regular coin
	sprite_index = spr_coin;
	
	//Make it invisible
	visible = false;
	
	//Turn visible
	alarm[0] = 30;
}

//Otherwise
else if (visible == true)
	event_perform_object(obj_coin, ev_collision, obj_mario);