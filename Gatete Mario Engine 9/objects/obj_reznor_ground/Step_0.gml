/// @description Start collapsing if there's half of the initial reznors

if (ready == 0)
&& (first == true) 
&& ((reznors > 0) && (instance_number(obj_reznor_enemy) == (reznors / 2))) {

	//Play 'Break' sound
	audio_play_sound(snd_break, 0, false);
	
	//Set solid position
	with (mysolid) {
	
		x = -1000;
		y = -1000;
	}
	
	//Mark as ready
	ready = 1;
	
	//Make it invisible
	visible = false;
	
	//Create smoke effect
	instance_create_depth(x+8, y+8, -6, obj_smoke);
	
	//If this makes the left bridge part to collapse
	if (right == false) {
	
		//Make the bridge piece to the left collapse
		var inst_l = instance_position(bbox_left - 1, y+8, obj_reznor_ground);
		
		//If there's a bridge piece and this one is visible, "destroy" it
		if (inst_l)
		&& (inst_l.visible == true)
			with (inst_l) alarm[0] = 60;
	}
	
	//Otherwise
	else if (right == true) {
		
		//Make the bridge piece to the right collapse
		var inst_r = instance_position(bbox_right + 1, y+8, obj_reznor_ground);
		
		//If there's a bridge piece and this one is visible, "destroy" it
		if (inst_r)
		&& (inst_r.visible == true)
			with (inst_r) alarm[0] = 60;
	}
}