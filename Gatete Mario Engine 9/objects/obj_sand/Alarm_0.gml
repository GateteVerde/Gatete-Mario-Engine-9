/// @description Finish pull

//If the puller object exists
if (instance_exists(obj_puller)) {
	
	//Play 'Pickup' sound
    audio_play_sound(snd_pickup, 0, false);

    //With Mario
    with (obj_mario) {
    
        visible = 1;
        holding = 0;
        enable_control = true;
    }
    
    //Destroy puller
    with (obj_puller) instance_destroy();
	
	//Create smoke effect
	with (instance_create_depth(x, y, -6, obj_smoke)) {
	
		sprite_index = spr_sand;
		vspeed = -1;
	}
    
    //Destroy
    instance_destroy();
}