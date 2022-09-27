/// @description Item check

//Heart
if (sprite_index == spr_heart) {
	
	//If health mode is activated, replace this with a mushroom
	if (global.hp_mode == true)
		sprite_index = spr_mushroom;
}

//Leaf
else if (sprite_index == spr_leaf) {

    //Play 'Sprout' sound
    audio_play_sound(snd_sprout, 0, false);

    //Turn into a real leaf
	if (yspeed > 0) {
		
		with (instance_create_depth(x, ystart + 16, 11, obj_leaf_sprout))
			alarm[1] = 1;
	}
	else
		instance_create_depth(x, ystart, 11, obj_leaf_sprout);
}

//Feather
else if (sprite_index == spr_feather) {

    //Play 'Sprout' sound
    audio_play_sound(snd_sprout, 0, false);

    //Turn into a real feather
	if (yspeed > 0) {
		
		with (instance_create_depth(x, ystart + 16, 11, obj_feather_sprout))
			alarm[1] = 1;
	}
	else
		instance_create_depth(x, ystart, 11, obj_feather_sprout);
}

//Propeller Mushroom
else if (sprite_index == spr_propellershroom) {

	//Play 'Sprout' sound
	audio_play_sound(snd_sprout, 0, false);
	
    //Turn into a real leaf
	if (yspeed > 0) {
		
		with (instance_create_depth(x, ystart + 16, 11, obj_propellershroom_sprout)) {
			
			xspeed = 1;
			alarm[1] = 1;
		}
	}
	else
		instance_create_depth(x, ystart, 11, obj_propellershroom_sprout);
}

//Superbell
else if ((yspeed < 0) && (sprite_index == spr_superbell)) {

	//Play 'Sprout' sound
	audio_play_sound(snd_sprout, 0, false);
	
	//Turn into a superbell
	with (instance_create_depth(x, ystart, 11, obj_superbell)) {
		
		depth = 10;
		yspeed = -4;
	}
}

//Fiery Leaf
else if (sprite_index == spr_fieryleaf) {

    //Play 'Sprout' sound
    audio_play_sound(snd_sprout, 0, false);

    //Turn into a real leaf
	if (yspeed > 0) {
		
		with (instance_create_depth(x, ystart + 16, 11, obj_fieryleaf_sprout))
			alarm[1] = 1;
	}
	else
		instance_create_depth(x, ystart, 11, obj_fieryleaf_sprout);
}

//Chill Leaf
else if (sprite_index == spr_chillleaf) {

    //Play 'Sprout' sound
    audio_play_sound(snd_sprout, 0, false);

    //Turn into a real leaf
	if (yspeed > 0) {
		
		with (instance_create_depth(x, ystart + 16, 11, obj_chillleaf_sprout))
			alarm[1] = 1;
	}
	else
		instance_create_depth(x, ystart, 11, obj_chillleaf_sprout);
}

//Beanstalk
else if (sprite_index == spr_beanstalk) {

	instance_create_layer(x, ystart, "Main", obj_beanstalk);
}

//Side Beanstalk
else if (sprite_index == spr_beanstalk_side) {

	with (instance_create_layer(x, ystart, "Main", obj_beanstalk)) {
		
		sprite_index = spr_beanstalk_side;
		vinetype = 1;
	}
}
    
//Otherwise
else {

    //Play 'Sprout' sound
    audio_play_sound(snd_sprout, 0, false);
	if (big == 1) {
	
		shake_camera(6, ceil(audio_sound_length(snd_sprout) * room_speed), true);
	}
    
    //If moving up...
    if (yspeed < 0) {
    
        //...and the sprite is one of the following, make it bounce.
        if (sprite_index == spr_pswitch)
        || (sprite_index == spr_gswitch)
        || (sprite_index == spr_trampoline)
		|| (sprite_index == spr_key)
		|| (sprite_index == spr_propellerblock) 
		|| (sprite_index == spr_powblock)
		|| (sprite_index == spr_billygun)
		|| (sprite_index == spr_egg) 
		|| (sprite_index == spr_egg_r)
		|| (sprite_index == spr_egg_y)
		|| (sprite_index == spr_egg_b)
		|| (sprite_index == spr_egg_t)
		|| (sprite_index == spr_egg_p) 
		|| (sprite_index == spr_shoe_kuribo)
		|| (sprite_index == spr_shoe_baburu)
		|| (sprite_index == spr_shoe_dossun)
		|| (sprite_index == spr_shoe_jugemu)
		|| (sprite_index == spr_shoe_pentaro) {
        
            //Set vertical speed
            yspeed = (place_meeting(x, y, obj_swim)) ? -1.25 : -2.5;
            
            //Deny solid check
            readytogo = 1;
            
            //Make it bounce outside the block
            bouncy = 1;
        }
    }
    
    //Exit
    exit;
}

//Destroy
instance_destroy();