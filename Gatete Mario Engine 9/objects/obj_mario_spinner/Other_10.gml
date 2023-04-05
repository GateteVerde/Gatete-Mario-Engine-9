/// @description Set up for powerup

// Check powerup
switch (global.powerup) {
	
	//Wind
	case (cs_wind):
	
		// Play 'Spin' sound
		audio_stop_sound(snd_spin);
        audio_play_sound(snd_spin, 0, false);
        
        // Set the speed
        image_speed = 0.3;
        
        // Set the sprite
        sprite_index = spr_mario_wind_attack;
		
		// Throw snowballs
		alarm[0] = 1;

		break;
	
	//Chill Raccoon
    case (cs_iraccoon):
    
        // Play 'Spin' sound
		audio_stop_sound(snd_spin);
        audio_play_sound(snd_spin, 0, false);
        
        // Set the speed
        image_speed = 0.3;
        
        // Set the sprite
        sprite_index = spr_mario_raccoon_attack;
		
		// Throw snowballs
		alarm[0] = 1;

		break;
		
	//Fiery Raccoon
    case (cs_fraccoon):
    
        // Play 'Spin' sound
		audio_stop_sound(snd_spin);
        audio_play_sound(snd_spin, 0, false);
        
        // Set the speed
        image_speed = 0.3;
        
        // Set the sprite
        sprite_index = spr_mario_raccoon_attack;
		
		// Throw fireballs
		alarm[0] = 1;

		break;
	
	//Ranger
	case (cs_ranger):
	
		audio_stop_sound(snd_whip);
		audio_play_sound(snd_whip, 0, false);
		
		//Set the speed
		image_speed = 0.2;
		
		//Set the sprite
		sprite_index = spr_mario_ranger_attack;
		
		break;
    
    //Cat
    case (cs_bell):
    
        //Play 'Scratch' sound
		audio_stop_sound(snd_scratch);
        audio_play_sound(snd_scratch, 0, false);
        
        // Set the speed
        image_speed = 0.2;
        
        // Set the sprite
        sprite_index = spr_mario_cat_attack2;

		break;
    
    //Tanooki
    case (cs_tanooki):
    
        // Play 'Spin' sound
		audio_stop_sound(snd_spin);
        audio_play_sound(snd_spin, 0, false);
        
        // Set the speed
        image_speed = 0.3;
        
        // Set the sprite
        sprite_index = spr_mario_tanooki_attack;

		break;
		
	case (cs_cape):
	
        // Play 'Spin' sound
		audio_stop_sound(snd_spin);
        audio_play_sound(snd_spin, 0, false);
        
        // Set the speed
        image_speed = 0.3;
        
        // Set the sprite
        sprite_index = spr_mario_big_spin;

		break;
    
    //Default
    default:
        
        //Play 'Spin' sound
		audio_stop_sound(snd_spin);
        audio_play_sound(snd_spin, 0, false);
        
        //Set the speed
        image_speed = 0.3;
        
        //Set the sprite
        sprite_index = spr_mario_raccoon_attack;
		
		break;
		
}

// Spinning end function
spinning_end = function() {
	
	// Destroy object
	instance_destroy();
	
	// Remove reference
	owner.spin = noone;	
}

// Spin timer
timer(spinning_end, ceil(image_number / image_speed), false);