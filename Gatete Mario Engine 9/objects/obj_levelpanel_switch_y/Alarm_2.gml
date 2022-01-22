/// @description Animate and set beat animation

//If there's not effects left
if (eff == 0) {

    //Play 'Destroy' sound
    audio_play_sound(snd_destroy, 0, false);
    
    //Turn into a stomped switch
    image_speed = 0;
    image_index = 1;
    
    //Mark as beaten
    beaten = 2;
    
    //Create smoke effect
    with (instance_create_depth(x+8, y+8, -4, obj_smoke)) {
		
		image_xscale = 1.5;
		image_yscale = 1.5;
	}
	
	//End clear sequence
	global.clear = 0;
    
	//Make Mario able to move again
	with (obj_mapmario) alarm[1] = 64;
}

//Otherwise
else if (eff > 0) {

    //Play 'Inventory' sound
	audio_stop_sound(snd_inventory);
    audio_play_sound(snd_inventory, 0, false);
    
    //Initialize temp variable
    var a;
    a = 0;
    
    //Repeat 8 times
    repeat (8) {
    
        with (instance_create_depth(x, y-4, -4, obj_shard_switch)) {
        
            //Set the sprite and frame
            sprite_index = other.sprite_index;
            image_speed = 0;
            image_index = 2;
            
            //Set the motion
            motion_set(a, 6);
        }
        
        //Set new direction
        a += 45;
    }
    
    //Repeat
    eff--;
    if (eff > 0)
        alarm[2] = 15;
    else
        alarm[2] = 90;
}