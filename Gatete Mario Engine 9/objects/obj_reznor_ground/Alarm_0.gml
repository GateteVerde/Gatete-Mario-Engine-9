/// @description Make bridge collapse

//If not ready
if (ready == 0) 
&& (instance_exists(obj_mario)) {

	//Play 'Break' sound
	audio_play_sound(snd_break, 0, false);
	
	//Set solid position
	with (mysolid) {
	
		x = -1000;
		y = -1000;
	}
	
	//Mark as ready
	ready = 1;

	//Mark as invisible
	visible = false;
	
	//Create smoke effect
	instance_create_depth(x+8, y+8, -6, obj_smoke);
	
	//Make the bridge piece to the left collapse
	var inst_l = instance_position(x-8, y+8, obj_reznor_ground);
	if (inst_l)
	&& (inst_l.ready == 0)
		with (inst_l) alarm[0] = 60;
		
	//Make the bridge piece to the right collapse
	var inst_r = instance_position(x+24, y+8, obj_reznor_ground);
	if (inst_r)
	&& (inst_r.ready == 0)
		with (inst_r) alarm[0] = 60;
}