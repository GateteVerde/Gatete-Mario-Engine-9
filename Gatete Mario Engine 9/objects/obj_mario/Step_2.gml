/// @description Mario's animation!

//Reset up firing
if (firing > 0)
&& (state == playerstate.walk)
    firing = 0;
	
//Ensure Mario has a cape
if (global.powerup == cs_cape) {
	
	// Create cape
	if (cape == noone) {
		
		cape = instance_create_depth(x, y, depth+1, obj_cape);
		cape.image_xscale = xscale;
		cape.owner = id;		
	}
} 

//If the cape power-up is not equipped
else if (cape != noone) {
	
	// Dispose of the object
	instance_destroy(cape);
	
	// Set cape to noone
	cape = noone;	
}

//If Mario is crouched down
if (crouch == true) {
	
	//Set the sprite
    sprite_index = global.duck_sprite[global.powerup];

    //If Mario has the leaf or tanooki powerups
    if (global.powerup == cs_raccoon) 
	|| (global.powerup == cs_tanooki)
	|| (global.powerup == cs_fraccoon) 
	|| (global.powerup == cs_iraccoon) {
    
        //Do not animate unless the script permits it.
        image_speed = 0;
    
        //Check if Mario is holding something first.
        if (holding == 0)
            image_index = 0+(wiggle/4);
        else if (holding == 2)
            image_index = 5+(wiggle/4);
        else
            image_index = 4;
    }
    else {
    
        //Do not animate
        image_speed = 0;
        
        //Set up the correct frame
        if (holding = 0)
            image_index = 0;
        else {
        
            if (holding == 2)
                image_index = 2;
            else
                image_index = 1;
        }
    }
    
    //Set the mask
    mask_index = spr_mask_mario;
    
    //Stop 'Skid' sound
    if (audio_is_playing(snd_skid))
        audio_stop_sound(snd_skid);
}
else {

    //If Mario is not holding anything
    if (holding == 0) {
    
        //If Mario is not sliding down a slope
        if (!sliding) {
        
            //If Mario is not kicking/throwing something.
            if (!kicking) {
            
                //If Mario is not doing anything
                if (state == playerstate.idle) {
                
                    //If Mario is firing something
                    if (firing > 0) 
                    && (sprite_index != global.somersault_sprite[global.powerup]) {
                    
                        //Set the sprite
                        sprite_index = global.attack_sprite[global.powerup];
                        
                        //Do not animate
                        image_speed = 0;
                        
                        //Decrement fire
                        firing--;
                        
                        //...but set the appropiate frame
                        if (firing > 4)
                            image_index = 0;
                        else
                            image_index = 1;
                    }
                    else {
                    
                        //Set the sprite
                        sprite_index = global.walk_sprite[global.powerup];
                        
                        //Do not animate
                        image_speed = 0;
                        image_index = 0;
                    }
                }
                
                //Otherwise, if Mario is walking
                else if (state == playerstate.walk) {
                
                    //Check first the horizontal speed and facing direction of Mario.
                    if ((((xspeed > 0.1) && (xscale == -1))
                    || ((xspeed < -0.1) && (xscale == 1)))
                    && (!swimming)
					&& (!isslip)
                    && (global.powerup != cs_frog)) {
						
						//If Mario is tiny
						if (global.powerup == cs_tiny)
						&& (!collision_point(x, bbox_bottom+1, obj_swim, 0, 0)) {
							
	                        //Set the skidding sprite
	                        sprite_index = global.skid_sprite[global.powerup];
                        
	                        //Do not animate
	                        image_speed = 0;
	                        image_index = 0;
                        
	                        //Play 'Skid' sound
	                        if (!audio_is_playing(snd_skid))
	                            audio_play_sound(snd_skid, 0, true);							
						}
						else {

	                        //Set the skidding sprite
	                        sprite_index = global.skid_sprite[global.powerup];
                        
	                        //Do not animate
	                        image_speed = 0;
	                        image_index = 0;
                        
	                        //Play 'Skid' sound
	                        if (!audio_is_playing(snd_skid))
	                            audio_play_sound(snd_skid, 0, true);
						}
                    }
                    
                    //Set the animation speed
                    else {
                        
                        //If Mario does not have the frog powerup
                        if (global.powerup != cs_frog)
                        && (global.powerup != cs_penguin) 
							image_speed = 0.065+abs(xspeed) / ((global.powerup == cs_mega) ? 15 : 7.5);
                            
                        //Otherwise, if Mario does have the frog suit.
                        else if (global.powerup == cs_frog) {
                            
                            //If Mario is swimming
                            if (swimming) {
                            
                                //If Mario is not holding anything.
                                if (holding == 0) {
                                
                                    if (xspeed == 0)
                                        image_speed = 0.1;
                                    else
                                        image_speed = 0.1+(0.1*input_check(input.action_1));
                                }
                                else
                                    image_speed = isslip * 0.065+abs(xspeed)/7.5;
                            }
                            
                            //Otherwise, if Mario is not swimming
                            else {
                            
                                if (holding == 0)
                                    image_speed = 0.1;
                                else
                                    image_speed = isslip * 0.065+abs(xspeed)/7.5;
                            }                        
                        }
                        
                        //Otherwise, if Mario does have the penguin suit.
                        else if (global.powerup == cs_penguin) {
                            
                            //If Mario is swimming
                            if (swimming) {
                            
                                //If Mario is not holding anything.
                                if (holding == 0) {
                                
                                    if (xspeed == 0)
                                        image_speed = 0.1;
                                    else
                                        image_speed = 0.1+(0.1*input_check(input.action_1));
                                }
                                else
                                    image_speed = isslip * 0.065+abs(xspeed)/7.5;
                            }
                            
                            //Otherwise, if Mario is not swimming
                            else
                                image_speed = 0.065+abs(xspeed)/7.5;                         
                        }
                    
                        //If Mario is running
                        if (run) {
							
							if (global.powerup != cs_bell)
								sprite_index = global.run_sprite[global.powerup];
							else
								sprite_index = global.walk_sprite[global.powerup];
						}
                        else {
                                             
                            if ((global.powerup == cs_frog)
                            || (global.powerup == cs_penguin))
                            && (swimming) {
								
								if (state = playerstate.idle)
									sprite_index = global.swim_sprite[global.powerup];
								else
									sprite_index = global.swim2_sprite[global.powerup];
							}
                            else
                                sprite_index = global.walk_sprite[global.powerup];
                        }
                    }
                }
                
                //Otherwise, if Mario is jumping
                else if (state == playerstate.jump) {
                
                    //If Mario is shooting a projectile
                    if (firing > 0) 
                    && (sprite_index != global.somersault_sprite[global.powerup]) {
                    
                        //Set the sprite
                        sprite_index = global.attack_sprite[global.powerup];
                        
                        //Do not animate
                        image_speed = 0;
                        
                        //Decrement fire
                        firing--;
                        
                        //...but set the appropiate frame
                        if (firing > 4)
                            image_index = 2;
                        else
                            image_index = 3;                    
                    }
                
                    //Otherwise, if Mario is not shooting a projectile.
                    else {
                        
                        //If Mario is not swimming
                        if (!swimming) {
							
							//If the player is doing a groundpound
							if (groundpound > 0) {
								
								//If the player is spinning
								if (groundpound == 1)
									sprite_index = global.somersault_sprite[global.powerup];
									
								//Otherwise
								else if (groundpound == 2)
									sprite_index = global.slide_sprite[global.powerup];
							}
							
							//Otherwise, if Mario is doing a twirl
							else if (twirl == 1) {
							
								//Set the spinning sprite
	                            sprite_index = global.spin_sprite[global.powerup];
                                    
	                            //Animate it
	                            image_speed = 0.4;
							}
							
							//Otherwise, if the player is doing the second jump
							else if ((triplejump == 2) && (somersault == 0)) {
								
								//If Mario does have the football or cat powerup
								if (global.powerup == cs_bell)
								|| (global.powerup == cs_football) {
								
									//Set the sprite
									sprite_index = global.jump_sprite[global.powerup];
									
									//Do not animate
									image_speed = 0;
									
									//If moving up
									if (yspeed < 0)
										image_index = 0;
									else
										image_index = 1;
								}
								
								//Otherwise
								else {
							
									//Set the sprite
									sprite_index = global.run_sprite[global.powerup];
									image_speed = 0;
									image_index = 1;
								}
							}
							
							//Otherwise
							else {
                        
	                            //If Mario is doing a spinjump
	                            if (jumpstyle > 0) {
                            
	                                //If Mario does have the propeller suit
	                                if (global.powerup == cs_propeller) {
                                
	                                    //If moving up
	                                    if (yspeed < 0) {
                                    
											//Animate it
	                                        image_speed = 0.065+abs(yspeed)/7.5;
										
	                                        //Set the special spinning sprite
	                                        sprite_index = global.spin3_sprite[global.powerup];
	                                    }
	                                    else {
                                    
	                                        //Set the spinning sprite
											if ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5)) {
											
												image_speed = 1;
												sprite_index = global.spin2_sprite[global.powerup];
											}
											else {
											
												image_speed = 0.2;
												sprite_index = global.spin_sprite[global.powerup];
											}
	                                    }
	                                }
                                
	                                //If Mario does not have the propeller or cat suit
	                                else {
                                
	                                    //Set the spinning sprite
	                                    sprite_index = global.spin_sprite[global.powerup];
                                    
	                                    //Animate it
	                                    image_speed = 0.5;
	                                }
	                            }
                            
	                            //If Mario is not doing a spin jump
	                            else {
                            
	                                //If the player is doing a somersault
	                                if (somersault) {
									
										//Do not animate
	                                    image_speed = 0;
	                                    image_index = 0;
                                
	                                    //Set up the somersault sprite
										if (global.powerup == cs_cape)
											sprite_index = spr_mario_cape_somersault;
										else
											sprite_index = global.somersault_sprite[global.powerup];
	                                }
                             
	                                else {
                                
	                                    //If Mario does have the carrot powerup
	                                    if (global.powerup == cs_carrot) {
                                    
	                                        //If Mario is wallclimbing
	                                        if (wallkick == 1) {
                                        
	                                            //Set the sprite
	                                            sprite_index = global.walljump_sprite[global.powerup];
                                            
	                                            //Do not animate
	                                            image_speed = 0;
	                                            image_index = 0;
	                                        }
                                        
	                                        //Otherwise, if it's not
	                                        else {
												
												//If Mario is moving up
		                                        if (yspeed < 0)
		                                            image_index = 0;
		                                        else {
                                            
		                                            if (floatnow > 0)
		                                                image_speed = 0.15;
		                                            else {
                                                
		                                                if (run)
		                                                    image_index = 0;
		                                                else
		                                                    image_index = 1;
		                                            }
		                                        }
                                            
		                                        //If Mario is running
		                                        if (!run) 
		                                            sprite_index = global.jump_sprite[global.powerup];
		                                        else
													sprite_index = global.runjump_sprite[global.powerup];
	                                        }
	                                    }
                                    
	                                    //Else, if Mario does have the bee powerup
	                                    else if (global.powerup == cs_bee) {
                                    
	                                        //If Mario is wallclimbing
	                                        if (wallkick == 1) {
                                        
	                                            //Set the sprite
	                                            sprite_index = global.walljump_sprite[global.powerup];
                                            
	                                            //Do not animate
	                                            image_speed = 0;
	                                            image_index = 0;                                
	                                        }
	                                        else {
                                        
		                                        //If Mario is moving down
		                                        if (yspeed > 0)
		                                            image_index = 1;
		                                        else {
                                            
		                                            if (floatnow > 0)
		                                                image_speed = 0.15;
		                                            else if (yspeed < -1.1)
		                                                image_index = 0;
		                                        }
                                                                                
		                                        //If Mario is running
		                                        if (!run)
		                                            sprite_index = global.jump_sprite[global.powerup];
		                                        else
		                                            sprite_index = global.runjump_sprite[global.powerup];
											}
	                                    }
									
										//Otherwise, if Mario is wearing the Squirrel suit
										else if (global.powerup == cs_squirrel)
										&& ((squirrelpropel == 1) || ((yspeed > 0) && (input_check(input.action_0)))) {
										
											//Set the sprite
											sprite_index = global.float_sprite[global.powerup];
										
											//If moving up
											if (yspeed < 0)
								                image_index = 0;
											
											//If not propelled up
								            else if (squirrelpropel == 0)
								                image_index = 1;
										
											//Otherwise, if propelled up
								            else
								                image_speed = 0.15;
										}
                                    
	                                    //Otherwise, if Mario does not have any of the above powerups
	                                    else {
                                    
	                                        //Do not animate
	                                        image_speed = 0;
                                        
	                                        //If Mario does have the frog powerup
	                                        if (global.powerup == cs_frog) {
                                        
	                                            //If Mario is wallclimbing
	                                            if (wallkick == 1) {
                                            
	                                                //Set the sprite
	                                                sprite_index = global.walljump_sprite[global.powerup];
                                                
	                                                //Do not animate
	                                                image_speed = 0;
	                                                image_index = 0;
	                                            }
                                            
	                                            //Otherwise, if it's not wallclimbing
	                                            else {
                                    
	                                                //Set the sprite
	                                                sprite_index = global.walk_sprite[global.powerup];
                                            
	                                                //Set up the frame
	                                                image_index = 2;
	                                            }
	                                        }
                                        
	                                        //Otherwise, if Mario does not have the frog powerup
	                                        else {
                                        
	                                            //If Mario is wallclimbing
	                                            if (wallkick == 1) {
                                            
	                                                //If Mario does have the Cat powerup
	                                                if (global.powerup == cs_bell) {
                                                
	                                                    //Set the alt climbing sprite
	                                                    sprite_index = global.climb2_sprite[global.powerup];
                                                    
	                                                    //Animate
	                                                    if (yspeed < 0) 
	                                                        image_speed = 0.15;
	                                                    else {
                                                    
	                                                        image_speed = 0;
	                                                        image_index = 0;
	                                                    }
	                                                }
	                                                else {
                                                
	                                                    //Set the skid sprite
	                                                    sprite_index = global.walljump_sprite[global.powerup];
                                                    
	                                                    //Do not animate
	                                                    image_speed = 0;
	                                                    image_index = 0;
	                                                }
	                                            }
	                                            else {
                                    
	                                                //...but set the appropiate frame
	                                                if (yspeed < 0) {
                                                
	                                                    if (global.powerup == cs_raccoon) 
														|| (global.powerup == cs_tanooki)
														|| (global.powerup == cs_fraccoon)
														|| (global.powerup == cs_iraccoon)
	                                                        image_index = 0+(wiggle/4);
	                                                    else
	                                                        image_index = 0;
	                                                }
	                                                else {
                                                
	                                                    //If Mario is running
	                                                    if (run)
	                                                        image_index = 0+(wiggle/4);
	                                                    else
	                                                        image_index = 1+(wiggle/4);
	                                                }
                                                
	                                                //Set the appropiate sprite
	                                                if (!run)
	                                                && (global.pwing == 0)
	                                                    sprite_index = global.jump_sprite[global.powerup];
	                                                else {
													
														if (global.powerup != cs_bell)
															sprite_index = (global.powerup == cs_tiny) ? global.jump_sprite[global.powerup] : global.runjump_sprite[global.powerup];
														else
															sprite_index = global.jump_sprite[global.powerup];
													}
	                                            }
	                                        }
	                                    }
	                                }                 			
								}
                            }
                        }
                        
                        //Otherwise, if Mario is swimming
                        else if (swimming) {
                        
                            //If Mario does have either the frog or penguin powerups.
                            if (global.powerup == cs_frog)
                            || (global.powerup == cs_penguin) {
                            
                                //If Mario is swimming to the sides
                                if (swimtype == 0) {
                                
                                    //If not moving horizontally
                                    if (xspeed == 0) {
										
										sprite_index = global.swim_sprite[global.powerup];
                                        image_speed = 0.1;
									}
                                    else {
										
										sprite_index = global.swim2_sprite[global.powerup];
                                        image_speed = 0.1+(0.1*input_check(input.action_1));
									}
                                }
                                
                                //Otherwise, if Mario is swimming upwards
                                else if (swimtype == 1) {
                                
                                    //Set up the sprite
                                    sprite_index = global.swim3_sprite[global.powerup];
                                    
                                    //Set the speed
                                    if ((x != xprevious) || (y != yprevious))
                                        image_speed = 0.1+(0.1*input_check(input.action_1));
                                    else
                                        image_speed = 0;
                                }
                                
                                //Otherwise, if Mario is swimming downwards
                                else if (swimtype == 2) {
                                
                                    //Set up the sprite
                                    sprite_index = global.swim4_sprite[global.powerup];
                                    
                                    //Set the speed
                                    if ((x != xprevious) || (y != yprevious))
                                        image_speed = 0.1+(0.1*input_check(input.action_1));
                                    else
                                        image_speed = 0;
                                }
                            }
                            
                            //Otherwise, if Mario does not have any of the above powerups
                            else {
                            
                                //Set up the sprite
                                sprite_index = global.swim_sprite[global.powerup];
                                
                                //Set the speed
                                if (yspeed < 0)
                                    image_speed = 0.15;
                                else {
                                
                                    image_speed = 0;
                                    image_index = 0;
                                }
                            }
                        }
                    }
                }
                
                //Otherwise, if Mario is climbing
                else if (state == playerstate.climb) {
					
					//If the climbing sprite is the SMB3 / SMW one
					if (climbstyle == 0) {
                
	                    //Set up the sprite
	                    sprite_index = global.climb_sprite[global.powerup];
                    
	                    //Set the speed
	                    if ((xspeed != 0) || (yspeed < 0))
	                        image_speed = 0.15;
	                    else {
                    
	                        image_speed = 0;
	                        image_index = 0;
	                    }
					}
					
					//Otherwise
					else if (climbstyle == 1) {
					
	                    //Set up the sprite
	                    sprite_index = global.goal_sprite[global.powerup];
                    
	                    //Set the speed
	                    if (yspeed != 0)
	                        image_speed = 0.15;
	                    else
	                        image_speed = 0;				
					}
                }
            }
            
            //Otherwise, if Mario is kicking or throwing something
            else if (kicking > 0) {
            
                //Set up the sprite
                sprite_index = global.kick_sprite[global.powerup];
                
                //Set the frame
                image_speed = 0;
                if ((kicking == 1) || (kicking == 3))
                    image_index = 0;
                else
                    image_index = 1;
            }
        }
        
        //Otherwise, if Mario is sliding down a slope
        else if (sliding) {
        
            //If Mario does have the shell powerup
            if (global.powerup == cs_shell) {
            
                //If the sprite is not the sliding one
                if (sprite_index != global.slide_sprite[global.powerup]) {
                
                    //Set up the sprite
                    sprite_index = global.slide_sprite[global.powerup];
                    
                    //Set up the frame
                    if (image_index != 0)
                        image_index = 0;
                }
                
                //Animate
                image_speed = isslip * 0.065+abs(xspeed)/7.5;
            }
            else {
                
                //Set up the sprite
                sprite_index = global.slide_sprite[global.powerup];
                
                //Do not animate
                image_speed = 0;
                image_index = 0;
            }
        }
    }
    
    //Otherwise, if Mario is carrying something over his head
    else if (holding == 1) {
    
		#region SPRITE
		
	        //Set up the sprite
			if (global.powerup != cs_raccoon)
			&& (global.powerup != cs_tanooki)
			&& (global.powerup != cs_fraccoon)
			&& (global.powerup != cs_iraccoon)
				sprite_index = global.carry_sprite[global.powerup];
			
			//Otherwise
			else {

				if (state == playerstate.jump)
					sprite_index = global.carry_jump_sprite[global.powerup];
				else
					sprite_index = global.carry_sprite[global.powerup];
			}
		
		#endregion
        
        //If Mario is not walking
        if (state == playerstate.idle) {
        
            //Do not animate
            image_speed = 0;
            image_index = 0;
        }
        
        //Otherwise, if Mario is walking
        else if (state == playerstate.walk) {
        
            //Set the animation speed
            image_speed = isslip * 0.065+abs(xspeed)/7.5;
        }
        
        //Otherwise, if Mario is jumping
        else if (state == playerstate.jump) {
        
            //If Mario does have either the carrot or bee powerup.
            if (global.powerup == cs_carrot) 
            || (global.powerup == cs_bee) {
            
                //If Mario is floating
                if (floatnow > 0)
                    image_speed = 0.15;
                else {
                
                    image_speed = 0;
                    image_index = 0;
                }
            }
            
            //Otherwise, if Mario does have either the raccoon or tanooki powerup.
            else if (global.powerup == cs_raccoon) 
			|| (global.powerup == cs_tanooki) 
			|| (global.powerup == cs_fraccoon) 
			|| (global.powerup == cs_iraccoon) {
            
                image_speed = 0;
                image_index = 0+(wiggle/4);
            }
            
            //Otherwise, do not animate
            else {
            
                image_speed = 0;
                image_index = 1;
            }
        }
    }
    
    //Otherwise, if Mario is holding something at his front
    else if (holding == 2) {
        
        //If Mario is not walking
        if (state == playerstate.idle) {
        
            //Do not animate
            image_speed = 0;
            image_index = 0;
        }
        
        //Otherwise, if Mario is walking
        else if (state == playerstate.walk) {
        
            //If Mario is not turning
            if (!turning)
                image_speed = isslip * 0.065+abs(xspeed)/7.5;
                
            //Otherwise, if Mario is turning
            else {

                image_speed = 0;
                image_index = 0;
            }
        }
        
        //Otherwise, if Mario is jumping
        else if (state == playerstate.jump) {
        
            //If the player is not turning
            if (!turning) {
            
                //If Mario does have either the carrot or bee powerup.
                if (global.powerup == cs_carrot) 
                || (global.powerup == cs_bee) {
                
                    //If Mario is floating
                    if (floatnow > 0)
                        image_speed = 0.15;
                    else {
                    
                        image_speed = 0;
                        image_index = 0;
                    }
                }
                
                //Otherwise, if Mario does have either the raccoon or tanooki powerup.
	            else if (global.powerup == cs_raccoon) 
				|| (global.powerup == cs_tanooki) 
				|| (global.powerup == cs_fraccoon) 
				|| (global.powerup == cs_iraccoon) {
                
                    image_speed = 0;
                    image_index = 0+(wiggle/4);
                }
                
                //Otherwise, do not animate
                else {
                
                    image_speed = 0;
                    image_index = 1;
                }
            }
            
            //Otherwise, set turning pose
            else {
            
                image_speed = 0;
                image_index = 0;
            }
        }
		
		//Otherwise, if Mario is climbing
		else if (state == playerstate.climb) {
		
			//Set up the sprite
	        sprite_index = global.climb_sprite[global.powerup];
                    
	        //Set the speed
	        if ((xspeed != 0) || (yspeed < 0))
	            image_speed = 0.15;
	        else {
                    
	            image_speed = 0;
	            image_index = 0;
	        }
		}
        
        //Set the sprite
        if (!turning) {
			
			if (state != playerstate.climb) {
				
				#region SPRITE
		
			        //Set up the sprite
					if (global.powerup != cs_raccoon)
					&& (global.powerup != cs_tanooki)
					&& (global.powerup != cs_fraccoon)
					&& (global.powerup != cs_iraccoon)
						sprite_index = global.hold_sprite[global.powerup];
			
					//Otherwise
					else {

						if (state == playerstate.jump)
							sprite_index = global.hold_jump_sprite[global.powerup];
						else
							sprite_index = global.hold_sprite[global.powerup];
					}
		
				#endregion
			}
			else
				sprite_index = global.climb_sprite[global.powerup];
		}
        else
            sprite_index = global.spin_sprite[global.powerup];
    }
    
    //Otherwise, if Mario is carrying a boomerang
    else if (holding == 3) {
    
		#region SPRITE
		
	        //Set up the sprite
			if (global.powerup != cs_raccoon)
			&& (global.powerup != cs_tanooki)
			&& (global.powerup != cs_fraccoon)
			&& (global.powerup != cs_iraccoon)
				sprite_index = global.hold2_sprite[global.powerup];
			
			//Otherwise
			else {

				if (state == playerstate.jump)
					sprite_index = global.hold2_jump_sprite[global.powerup];
				else
					sprite_index = global.hold2_sprite[global.powerup];
			}
		
		#endregion
        
        //If Mario is not walking
        if (state == playerstate.idle) {
        
            //Do not animate
            image_speed = 0;
            image_index = 0;
        }
        
        //Otherwise, if Mario is walking
        else if (state == playerstate.walk) {
        
            //Set the animation speed
            image_speed = isslip * 0.065+abs(xspeed)/7.5;
        }
        
        //Otherwise, if Mario is jumping
        else if (state == playerstate.jump) {
        
            //If Mario does have either the carrot or bee powerup.
            if (global.powerup == cs_carrot) 
            || (global.powerup == cs_bee) {
            
                //If Mario is floating
                if (floatnow > 0)
                    image_speed = 0.15;
                else {
                
                    image_speed = 0;
                    image_index = 0;
                }
            }
            
            //Otherwise, if Mario does have either the raccoon or tanooki powerup.
            else if (global.powerup == cs_raccoon) 
			|| (global.powerup == cs_tanooki) 
			|| (global.powerup == cs_fraccoon) 
			|| (global.powerup == cs_iraccoon) {
            
                image_speed = 0;
                image_index = 0+(wiggle/4);
            }
            
            //Otherwise, do not animate
            else {
            
                image_speed = 0;
                image_index = 1;
            }
        }
    }
    
    //Set the tiny mask
    if (global.powerup == cs_tiny)
        mask_index = spr_mask_mario_tiny;
		
	//Otherwise, set up the small mask
	else if (global.powerup == cs_small)
		mask_index = spr_mask_mario;
		
	//Otherwise, set up the mega mask
	else if (global.powerup == cs_mega)
	&& (!instance_exists(obj_mario_transform))
		mask_index = spr_mask_mario_mega;
		
    else {
    
        //If Mario does have the frog powerup.
        if (global.powerup == cs_frog) {
        
            if (holding > 0)
                mask_index = spr_mask_mario_big;
            else
                mask_index = spr_mask_mario;
        }
        
        //Otherwise, if Mario does have the either the shell or penguin powerups.
        else if (global.powerup == cs_shell) 
        || (global.powerup == cs_penguin) {
        
            //If Mario is sliding down a slope
            if (sliding) {
				
				if (global.powerup == cs_shell)
					mask_index = spr_mask_mario_shell;
				else
					mask_index = spr_mask_mario;
			}
            else
                mask_index = spr_mask_mario_big;
        }
        
        //Otherwise, set the default mask
        else
            mask_index = spr_mask_mario_big;
    }
    
    //Stop the 'Skid' sound when not changing direction.
    if (sprite_index != global.skid_sprite[global.powerup])
    && (audio_is_playing(snd_skid))
        audio_stop_sound(snd_skid);
}

//If you currently have a spinner
if (spin != noone) {
	
	//Match sprites
	sprite_index = spin.sprite_index;
	
	//Match image index
	image_index = spin.image_index;
	
	//Inherit image speed (namely for cape speed)
	image_speed = spin.image_speed;	
}