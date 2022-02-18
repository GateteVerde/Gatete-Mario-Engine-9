/// @description Timer Actions

//Make Mario vulnerable to all hazards
become_vulnerable = function(_timer) {

	//Make Mario vulnerable to all hazards
	alarm[0] = 2;
	
	//Revert alpha
	image_alpha = 1;
	
	//Destroy the repeating timer
	timer_destroy(_timer);
}

//Makes Mario blink when invulnerable
change_alpha = function() {
	
	if (image_alpha != 1)
		image_alpha = 1;
	else
		image_alpha = 0.4;
}

//Allow turning
allow_turn = function() {

	canhang = 2;
}

//Allow climbing
allow_climb = function() {

	climbstyle = 0;
	canhang = 0;
	canturn = 0;
}

//End kicking
kicking_end = function() {

	kicking = 0;
}

//End turning
turning_end = function() {

	turning = 0;
}

//Allow wallkick
wallkick_allow = function() {

	wallkick = 0;
	wallready = 0;
}

//Throws projectiles
throw_projectile = function() {

	// If the proper parameters exist to be able to do powerup-specific actions
	if (enable_control == true)
	&& (sliding == 0)
	&& (holding == 0)
	&& (kicking == 0)
	&& (wallkick == 0)
	&& (groundpound == 0) {
        
		//Create statue
	    if (global.powerup == cs_tanooki)
	    && ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5))
	    && (global.mount == 0)
		&& (instance_number(obj_statue) < 1)
	    && (instance_number(obj_spinner) < 1) {
            
	        //Play the transform sound
	        audio_play_sound(snd_transform, 0, false);
    
	        //Create a poof
	        with (instance_create_depth(x, y, depth, obj_mario_transform)) sequence = 4;
        
	        //Create a statue and get the ID from Mario
	        spin = instance_create_depth(x, y, depth, obj_statue);
			with (spin)				
				owner = other.id;
	    }
    
	    //Cat
	    if (global.powerup == cs_bell)
	    && (global.mount == 0)
	    && (yspeed >= 0)
		&& (state == playerstate.jump)
	    && (instance_number(obj_spinner) == 0)
	    && (instance_number(obj_dropdown) == 0) 
		&& ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv > 0.5))){
    
	        //Create drop down
	        with (instance_create_depth(x, y, depth, obj_dropdown))
	            image_xscale = 1*sign(other.xscale);
	    }
    
	    //Actions to take only if not crouching
	    else if (!crouch) {
    
	        //Fireball
	        if (global.powerup == cs_fire)
	        && (instance_number(obj_fireball) < 2) {
				
				//Play 'Fireball' sound
				audio_play_sound(snd_fireball, 0, false);
        
				//Set firing animation time
	            firing = 9;
				
				//Create Fireball
	            with (instance_create_depth(x, y, -2, obj_fireball)) {
            
					//Match the speed to the player's direction
	                xspeed = 3*sign(other.xscale);
					
					//Make the fireball go upwards if the player is pressing up
	                if ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5))
	                    yspeed = -3;
	            }
	        }            
        
	        //Iceball
	        else if ((global.powerup == cs_ice) || ((global.powerup == cs_penguin) && (swimming == false)))
	        && (instance_number(obj_iceball) < 2) {
				
				//Play sound
				audio_play_sound(snd_iceball, 0, false);
        
				//Set firing animation time
	            firing = 9;
				
				//Create iceball
	            with (instance_create_depth(x, y, -2, obj_iceball)) {
            
	                xspeed = other.xspeed+(1.2*sign(other.xscale));
	                if ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5))
	                    yspeed = -3;
	            }
	        }
        
	        //Racoon, Tanooki, Cat, and Cape
	        else if (((global.powerup == cs_cape) && (!flying)) || (global.powerup == cs_raccoon) || (global.powerup == cs_tanooki) || (global.powerup == cs_bell) || (global.powerup == cs_ranger) || (global.powerup == cs_fraccoon) || (global.powerup == cs_iraccoon))
	        && (instance_number(obj_dropdown) == 0)
	        && (spin == noone) 
			&& (jumpstyle == 0) {
        
				//Create spinner
				spin = instance_create_depth(x, y, depth, obj_spinner);
		
				//Set up spinner
	            with (spin) {
					
					//Set scale
	                image_xscale = 1*sign(other.xscale);
					
					//Let the spinner know who created it
					owner = other.id;
					
					//Set up parameters for spinner
					event_user(0);					
				}
	        }
            
	        //Hammer
	        else if (global.powerup == cs_hammer)
	        && (instance_number(obj_hammer) < 2) {
        
				//Play 'Fireball' sound
				audio_play_sound(snd_fireball, 0, false);
				
				//Set firing animation frame
	            firing = 9;
				
				//Create a hammer
	            with (instance_create_depth(x, y, -2, obj_hammer)) {
            
	                hspeed = other.xspeed+(1.25*sign(other.xscale));
	                if ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5))
	                    vspeed = -5;
					else
						vspeed = -2.5;
	            }
	        }
        
	        //Boomerang
	        else if (global.powerup == cs_boomerang)
	        && (instance_number(obj_boomerang) < 2) {
				
				//Play 'Fireball' sound
				audio_play_sound(snd_fireball, 0, false);
				
				//Set firing animation frame
	            firing = 9;
				
				//Create a boomerang
	            with (instance_create_depth(x, y - 2, -2, obj_boomerang))
	                hspeed = 2*sign(other.xscale);
	        }
        
	        //Superball
	        else if (global.powerup == cs_superball)
	        && (instance_number(obj_superball) < 2) {
				
				//Play 'Fireball' sound
				audio_play_sound(snd_fireball, 0, false);
        
				//Set firing animation frame
	            firing = 9;
				
				//Create a superball
	            with (instance_create_depth(x, y, -2, obj_superball)) {
            
	                xspeed = 3*sign(other.xscale);
	                if ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5))
	                    yspeed = -3;
	            }
	        }
        
	        //Bomb
	        else if (global.powerup == cs_bomb)
	        && (instance_number(obj_bomb) < 1) {
        
	            with (instance_create_depth(x, y, depth+1, obj_bomb))
	                held = 1;
	        }
        
	        //Lightning
	        else if (global.powerup == cs_volt)
	        && (instance_number(obj_volt) < 2) {
        
				//Play 'Fireball' sound
				audio_play_sound(snd_fireball, 0, false);
				
				//Set firing animation frame
	            firing = 9;
				
				//Create a lightning volt
	            with (instance_create_depth(x, y+4, -2, obj_volt))
	                xspeed = 6*sign(other.xscale);
	        }
        
	        //Football
	        else if (global.powerup == cs_football)
	        && (instance_number(obj_football) < 1) {
        
	            with (instance_create_depth(x, y, depth+1, obj_football))
	                held = 1;
	        }
			
			//Gold Fireball
	        else if (global.powerup == cs_gold)
	        && (instance_number(obj_fireball_gold) < 2) {
				
				//Play 'Fireball' sound
				audio_play_sound(snd_fireball_gold, 0, false);
        
				//Set firing animation time
	            firing = 9;
				
				//Create Fireball
	            with (instance_create_depth(x, y-8, -2, obj_fireball_gold)) {
            
					//Match the speed to the player's direction
	                xspeed = 3*sign(other.xscale);
					
					//Make the fireball go upwards if the player is pressing up
	                if ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5))
	                    yspeed = -3;
	            }
	        }    			
	    }		
	}	
}

//Throws projectiles to the left when spinning
throw_projectile_spin = function() {
	
	//Only throw if doing a spin jump
	if (jumpstyle == 1) {
	
		//Fireball
		if ((global.powerup == cs_fire) || (global.powerup == cs_fraccoon)) {
			
			//If there's less than 2 fireballs on screen
			if (instance_number(obj_fireball) < 2) {
				
				//Play 'Fireball' sound
				audio_play_sound(snd_fireball, 0, false);
				
				//Create Fireball
			    with (instance_create_depth(x, y, -2, obj_fireball))
			        xspeed = 3*sign(other.dir);
			}
		}
	
		//Iceball
		else if ((global.powerup == cs_ice) || (global.powerup == cs_penguin) && (swimming == false) || (global.powerup == cs_iraccoon)) {
	
			//If there's less than 2 ice balls on screen
			if (instance_number(obj_iceball) < 2) {
			
				//Play 'Iceball' sound
				audio_play_sound(snd_iceball, 0, false);
		
				//Create Snowball
				with (instance_create_depth(x, y, -2, obj_iceball))
					xspeed = 1.2*sign(other.dir);
			}
			
		}
	
		//Hammer
		else if (global.powerup == cs_hammer) {
			
			//If there's less than 2 hammers on screen
			if (instance_number(obj_hammer) < 2) {
	
				//Play 'Hammer' sound
				audio_play_sound(snd_fireball, 0, false);
		
				//Create Snowball
				with (instance_create_depth(x, y, -2, obj_hammer)) {
				
					vspeed = -2.5;
					hspeed = other.xspeed+(1.25*sign(other.dir));
				}
			}
		}
		
		//Superball
		else if (global.powerup == cs_superball) {
			
			//If there's less than 2 super balls on screen
			if (instance_number(obj_superball) < 2) {
				
				//Play 'Superball' sound
				audio_play_sound(snd_fireball, 0, false);
				
				//Create Superball
			    with (instance_create_depth(x, y, -2, obj_superball)) {
				
			        xspeed = 3*sign(other.dir);
					yspeed = 3;
				}
			}
		}
		
		//Bolt
		else if (global.powerup == cs_volt) {
			
			//If there's less than 2 lightning bolt on screen
			if (instance_number(obj_volt) < 2) {
				
				//Play 'Superball' sound
				audio_play_sound(snd_fireball, 0, false);
				
				//Create Superball
			    with (instance_create_depth(x, y, -2, obj_volt))
			        xspeed = 6*sign(other.dir);
			}
		}
		
		//Gold Fireball
		else if (global.powerup == cs_gold) {
			
			//If there's less than 2 golden fireballs on screen
			if (instance_number(obj_fireball_gold) < 2) {
				
				//Play 'Fireball' sound
				audio_play_sound(snd_fireball_gold, 0, false);
				
				//Create Gold Fireball
			    with (instance_create_depth(x, y, -2, obj_fireball_gold))
			        xspeed = 3*sign(other.dir);
			}
		}
		
		//Change the facing direction
	    dir = -dir;
    
	    //Set alarm based on direction
	    if (dir == 1)
	        timer(throw_projectile_spin, 15);
	}
}