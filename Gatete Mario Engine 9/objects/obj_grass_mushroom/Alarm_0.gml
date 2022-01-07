/// @description Create mushroom

//If the puller object does exist
if (instance_exists(obj_puller)) {
	
	//Play 'Pickup' sound
	audio_play_sound(snd_pickup, 0, false);
	
	//Generate shards
	event_user(0)

	//Create mushroom
	with (instance_create_depth(obj_mario.x, obj_mario.bbox_top-16, -4, obj_mushroom)) {
			
		xspeed = 1 * sign(obj_mario.xscale);
		yspeed = -4;
	}
	
	//Set the puller sprite
	with (obj_puller) sprite_index = global.duck_sprite[global.powerup];
    
	//Finish pull
	alarm[1] = 15;
	
    //Make invisible
	visible = false;
}