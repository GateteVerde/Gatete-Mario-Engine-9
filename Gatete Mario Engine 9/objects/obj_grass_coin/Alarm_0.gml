/// @description Create coin

//If the puller object does exist
if (instance_exists(obj_mario_puller)) {
	
	//Play 'Pickup' sound
	audio_play_sound(snd_pickup, 0, false);
	
	//Play 'Pull' sound
	audio_play_sound(global.sound_pull, 0, false); 
    
    //Create coin
	instance_create_depth(obj_mario.x, obj_mario.bbox_top-16, -4, obj_block_coin);
	
	//Set the puller sprite
	with (obj_mario_puller) sprite_index = global.duck_sprite[global.powerup];
	
	//Finish pull
	alarm[1] = 15;
    
    //Make invisible
	visible = false;
}