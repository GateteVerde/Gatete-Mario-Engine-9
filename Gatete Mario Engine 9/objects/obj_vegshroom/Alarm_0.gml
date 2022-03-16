/// @description Create mushroom

//If the puller object does exist
if (instance_exists(obj_mario_puller)) {

    //Play 'Pickup' sound
    audio_play_sound(snd_pickup, 0, false);
    
    //Create pulled mushroom
    instance_create_depth(obj_mario.x-8, y, -4, obj_vegshroom_up);

	//Set the puller sprite
	with (obj_mario_puller) sprite_index = global.duck_sprite[global.powerup];
    
	//Finish pull
	alarm[1] = 15;
	
    //Make invisible
	visible = false;
}