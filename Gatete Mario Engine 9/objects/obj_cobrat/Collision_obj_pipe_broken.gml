/// @description Kill with broken pipes

//If there's not a solid in position
if (!position_meeting(x, y, obj_solid)) {

	//Play 'Kick' sound
	audio_play_sound(snd_kick, 0, false);

	//Perform kill event
	killer_id = other.id;
	event_user(0);
		
	//Get 200 points
	with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, bbox_top, -4, obj_score)) value = 200;

	//Destroy
	instance_destroy();
}