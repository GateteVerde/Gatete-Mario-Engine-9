/// @description Create a 1-UP mushroom

//If the puller object does exist
if (instance_exists(obj_mario_puller) && instance_exists(obj_mario)) {
	
	//Play 'Pickup' sound
	audio_play_sound(snd_pickup, 0, false);
	
	//Play 'Pull' sound
	audio_play_sound(global.voiceline_pull, 0, false); 
	
	//Generate shards
	event_user(0)

	//Create 1up mushroom
	with (instance_create_depth(obj_mario.x, obj_mario.bbox_top-16, -4, obj_1up)) {
			
		xspeed = 1 * sign(obj_mario.xscale);
		yspeed = -4;
	}
	
	//Set the puller sprite
	with (obj_mario_puller) sprite_index = global.duck_sprite[global.powerup];
    
	//Finish pull
	alarm[1] = 15;
	
    //Make invisible
	visible = false;
}