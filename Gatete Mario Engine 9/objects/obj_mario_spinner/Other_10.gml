/// @description Set up sprite for powerup

// Check powerup
switch (global.powerup) {
	
	//Wind
	case (cs_wind): {
	
		// Play 'Spin' sound
		audio_stop_sound(snd_spin);
        audio_play_sound(snd_spin, 0, false);
        
        // Set the speed
        image_speed = 0.3;
        
        // Set the sprite
		switch (global.player) {
																	
			//Mario
			case (0): sprite_index = spr_mario_wind_attack; break;
																	
			//Luigi
			case (1): sprite_index = spr_luigi_wind_attack; break;
		}
		
		// Throw snowballs
		alarm[0] = 1;

	} break;
	
	//Chill Raccoon
    case (cs_iraccoon): {
    
        // Play 'Spin' sound
		audio_stop_sound(snd_spin);
        audio_play_sound(snd_spin, 0, false);
        
        // Set the speed
        image_speed = 0.3;
        
        // Set the sprite
        sprite_index = global.attack_sprite[cs_raccoon];
		
		// Throw snowballs
		alarm[0] = 1;

	} break;
		
	//Fiery Raccoon
    case (cs_fraccoon): {
    
        // Play 'Spin' sound
		audio_stop_sound(snd_spin);
        audio_play_sound(snd_spin, 0, false);
        
        // Set the speed
        image_speed = 0.3;
        
        // Set the sprite
        sprite_index = global.attack_sprite[cs_raccoon];
		
		// Throw fireballs
		alarm[0] = 1;

	} break;
	
	//Ranger
	case (cs_ranger): {
	
		audio_stop_sound(snd_whip);
		audio_play_sound(snd_whip, 0, false);
		
		//Set the speed
		image_speed = 0.2;
		
		//Set the sprite
		sprite_index = global.attack_sprite[cs_ranger];
		
	} break;
    
    //Cat
    case (cs_bell): {
    
        //Play 'Scratch' sound
		audio_stop_sound(snd_scratch);
        audio_play_sound(snd_scratch, 0, false);
        
        // Set the speed
        image_speed = 0.2;
        
        // Set the sprite
        sprite_index = global.attack2_sprite[cs_bell];

	} break;
    
    //Tanooki
    case (cs_tanooki): {
    
        // Play 'Spin' sound
		audio_stop_sound(snd_spin);
        audio_play_sound(snd_spin, 0, false);
        
        // Set the speed
        image_speed = 0.3;
        
        // Set the sprite
        sprite_index = global.attack_sprite[cs_tanooki];

	} break;
		
	case (cs_cape): {
	
        // Play 'Spin' sound
		audio_stop_sound(snd_spin);
        audio_play_sound(snd_spin, 0, false);
        
        // Set the speed
        image_speed = 0.3;
        
        // Set the sprite
        sprite_index = global.spin_sprite[cs_big];

	} break;
    
    //Default
    default: {
        
        //Play 'Spin' sound
		audio_stop_sound(snd_spin);
        audio_play_sound(snd_spin, 0, false);
        
        //Set the speed
        image_speed = 0.3;
        
        //Set the sprite
        sprite_index = global.spin_sprite[cs_raccoon];
		
	} break;		
}