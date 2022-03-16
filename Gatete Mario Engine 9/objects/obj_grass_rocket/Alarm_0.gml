/// @description Finish pull

//If the puller object does exist
if (instance_exists(obj_mario_puller)) {

    //Play 'Pickup' sound
    audio_play_sound(snd_pickup, 0, false);
	
	//Get 1000 points
	with (instance_create_depth(x + 8, y, -6, obj_score)) value = 1000;
    
    //Create a rocket
	with (instance_create_depth(obj_mario.x, obj_mario.y, -5, obj_rocket)) {
		
		destination = other.destination;
		exit_id = other.exit_id;
	}
	
	//Destroy Mario and Puller
	with (obj_mario) instance_destroy();
	with (obj_mario_puller) instance_destroy();
    
    //Destroy
    instance_destroy();
}