/// @description Mario's logic!

#region MANAGE PALETTES, NET SMACKING, TRIPLE JUMP AND ANGLE

	//If the player is invulnerable
	if (instance_exists(obj_invincibility)) {
		
		//If there's a mega mushroom timer active
		if (instance_number(obj_megashroom_timer) > 0) {
			
			//If the mega mushroom is about to end
			if (obj_megashroom_timer.alarm[0] < 120) {
	
				//Set up palette
				isflashing += 0.1;
				if (isflashing > 6)
					isflashing = 0;
			}
			else
				isflashing = 0;
		}
		
		//Otherwise
		else {
			
			//If the starman is about to end
			if (obj_invincibility.alarm[0] < 120) {

				//Set up palette
				isflashing += 0.01;
				if (isflashing > 6.99)
					isflashing = 1;
			}
			
			//Otherwise
			else {
	
				//Set up palette
				isflashing += 0.05;
				if (isflashing > 6.99)
					isflashing = 1;
			}
		}
	}
	else {
		
		//If Mario is frozen, apply freeze palette
		if (freezetime > 0)
			isflashing = 8;
		else
			isflashing = 0;
	}
	
	//Set up angle if somersaulting, end if Mario is tiny
	if (somersault) {
		
		angle += -30*sign(xscale);
		if (global.powerup == cs_tiny)
		|| (global.powerup == cs_mega)
		|| (instance_number(obj_mario_statue) > 0)
		|| (instance_number(obj_mario_spinner) > 0)
		|| (twirl > 0)
		|| (holding > 0) 
		|| (groundpound == 2) {
		
			somersault = 0;
			angle = 0;
		}
	}
	
	//Manage triple jump
	if (triplejump > 0) {
		
		//Decrement timer (but only if in ground)
		if (state < playerstate.jump)
			tjtime--;
		
		//If the timer runs out, or Mario is spin-jumping, or Mario's horizontal speed is lower than 2.6...
		if (tjtime < 0) 
		|| (jumpstyle > 0)
		|| (abs(xspeed) < global.physics[global.player].phy_xspeed_max) {
			
			//Cancel triple jump
			triplejump = 0;
			tjtime = 0;
		}		
	}
	
	//Allow net smacking
	if (netsmack > 0)
		netsmack--;
	
#endregion

#region CHECK IF IN AIR
	
	if (state == 2)
	|| (statedelay > 0) {
		
		inair = 1;
		if (inairtime < 32)
			inairtime++;
	}
	else {
		
		inair = 0;
		inairtime = 0;
	}
#endregion

//Slippery surface check
isslip = (collision_rectangle(bbox_left, bbox_bottom-1, bbox_right, bbox_bottom+1, obj_slippery, 1, 0)) ? true : false;

//Update position based on xspeed, yspeed and yadd values
if (freeze == false) {
		
	x += xspeed;
	y += yspeed;
	xspeed += xadd;
	yspeed += yadd;
}

//Manage groundpound
if (groundpound > 0) {
	
	//If Mario is spinning
	if (groundpound == 1) {

		//Change angle
		angle += -30*sign(xscale);
	
		//If the angle is greater than 360
		if (abs(angle) > 360) {
			
			//Set the vertical motion
			yspeed = 4;
		
			//Set angle
			angle = 0;
			
			//Drop
			groundpound = 2;
		}
	}
}

//If Mario is under the effects of a mega mushroom
if (global.powerup == cs_mega) {
	
	//Stop somersault
	somersault = false;
	
	//Do not crouch
	crouch = false;
	
	//Set swim top
	swim_y = -32;
	
	//Set bottom collision
	if (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+4, obj_slopeparent, 1, 0))
		ismega = 0;
	else
		ismega = -24;
}
else {
	
	if (global.powerup == cs_tiny) {
		
		//Do not crouch
		crouch = false;
		
		//Set swim top
		swim_y = 9;
		
		//Set bottom collision
		ismega = 0;
	}
	else {
		
		ismega = -4;
		if (global.powerup == cs_small)
		|| (mask_index == spr_mask_mario)
			swim_y = 3;
		else
			swim_y = 0;
	}
}

//If active, manage P-Wing
if (global.pwing == 1) {

	//If Mario does not have the raccoon or tanooki powerups
	if (global.powerup != cs_raccoon)
	&& (global.powerup != cs_tanooki) 
	&& (global.powerup != cs_fraccoon) 
	&& (global.powerup != cs_iraccoon) {
	
		//Disable P-Wing
		global.pwing = 0;
		
		//End pmeter
		alarm[11] = -1;

		//Force end flight
		if (flying == 1)			
			flying = 0;
	}
	
	//Keep P-Meter active
	pmeter = global.pmeter_limit;
	alarm[11] = 60 * global.flighttime;
	
	//Loop P-Meter sound
	if (global.pmeter_sound == true)
	&& (!audio_is_playing(snd_pmeter))
		audio_play_sound(snd_pmeter, 0, true);
	
	//If the player is on the ground, do not apply fix
	if (state != playerstate.jump)
		flyfix = 0;
	else
		flyfix = 1;
}

//Otherwise, do not apply fix.
else {

	//If the player is on the ground, do not apply fix
	if (state != playerstate.jump) && (flying == 0)
		flyfix = 0;
	else
		flyfix = 1;
}

//If gravity is enabled
if (enable_gravity == 1) {
	
	// Memory y-speed for cape, added after speed check
	if (memory_yspeed != 0)
	&& (global.powerup == cs_cape) {
		
		yspeed = memory_yspeed;
		memory_yspeed = 0;		
	}
	
	//Decrease net smack
	netsmack--;
	
	//Manage stun time
	if (stuntime > 0) {
		
		//Disable control
		enable_control = false;
	
		//If the stun status is about to end
		if (stuntime == 1) {
		
			//Stop stun state
			stuntime = 0;
			
			//Stop shaking
			shake = 0;
			
			//Enable controls again
			enable_control = true;
		}
		
		//Decrease stun time
		stuntime--;
		
		//Set up shake offset
		if (shake != 1)
			shake = 1;
		else
			shake = 0;
	}
	else {
	
		if (shake != 0)
			shake = 0;
	}
	
	//Manage freeze time
	if (freezetime > 0) {
		
		//Decrement freezetime
		freezetime--;
	
		//If the freeze status is about to end
		if (freezetime == 1) {
		
			//Play 'Shatter' sound
			audio_play_sound(snd_icicle, 0, false);
			
			//Repeat 32 times
			repeat (32) {
			
				with (instance_create_depth(bbox_left + sprite_width/2, bbox_top + sprite_height / 2, -6, obj_sparkle))
					motion_set(random(360), random(1));
			}
			
			//Stop freeze status
			freezetime = 0;
			
			//Hurt the player
			event_user(0);
		}
	}
	
	//Make sure Mario is spinning when not having the propeller powerup
	if (global.powerup != cs_propeller)
	&& (jumpstyle == 2)
		jumpstyle = 1;
		
	//Make sure Mario stops spinning when holding something
	if ((holding > 0) && (holding < 4))
	&& (jumpstyle > 0)
		jumpstyle = 0;
		
	//Mute sounds when climbing or while swimming when having either frog or penguin powerups
	if (state == playerstate.climb)
	|| ((state == playerstate.jump) && (swimming == true) && ((global.powerup == cs_frog) || (global.powerup == cs_penguin)))
		noisy = 1;
	else
		noisy = 0;
		
	//If moving down
	if (yspeed >= 0) {

		//Check for any nearby ground collision
		var semisolid = collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+yspeed, obj_semisolid, 0, 0);
	
		//If there's ground below and Mario is not moving upwards
		if (semisolid)
		&& (bbox_bottom < semisolid.yprevious+5) 
		&& (!collision_rectangle(bbox_left, bbox_top+4, bbox_right, semisolid.y-1, obj_solid, 1, 0)) 
		&& (!collision_point(x, semisolid.y-1, obj_wanderingpit, 1, 0)) {
		
			//Snap above the semisolid
			y = semisolid.bbox_top-16;
	
			//Stop vertical movement
			yadd = 0;
			yspeed = 0;
		
			//Reset values
			event_user(15);
		}
		
		//Check for a subcon enemy
		var subcon = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+yspeed, obj_enemy_top, 0, 0);
		
		//If there's ground below and Mario is not moving upwards
		if (subcon)
		&& (bbox_bottom < subcon.yprevious+5) {
		
			//Snap above the semisolid
			y = subcon.bbox_top-16;
	
			//Stop vertical movement
			yadd = 0;
			yspeed = 0;
		
			//Reset values
			event_user(15);
		}

		//Check for a water surface
		var ws = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+yspeed, obj_swim, 0, 0);
		
		//If there's water and Mario is tiny and not jumping
		if (ws)
		&& (xspeed != 0)
		&& ((global.powerup == cs_tiny) || ((global.powerup == cs_penguin) && (sliding == true)))
		&& (bbox_bottom < ws.yprevious+5) {

			//Snap above the semisolid
			y = ws.bbox_top-16;
	
			//Stop vertical movement
			yadd = 0;
			yspeed = 0;
		
			//Reset values
			event_user(15);
			
			//Reset state delay
			statedelay = 0;
			
			//Set up state if we didn't yet
			if (xspeed == 0)
				state = playerstate.idle;
			else
				state = playerstate.walk;
		}
	}
	
	//Slope collision
	slope_collision();
	
	//Conveyor collision
	#region CONVEYOR COLLISION
	
		//If there's no gravity
		if (yadd == 0) {
	
			//Check for a conveyor
			var conveyor = collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+2, obj_conveyorparent, 0, 0);
		
			//If there's a conveyor
			if (conveyor)
			&& (conveyor.image_speed != 0) {
		
				//If the conveyor is moving and there's not solid on the way
				if ((conveyor.image_speed < 0) && (!collision_rectangle(bbox_left, bbox_top+4, bbox_left, bbox_bottom-1, obj_solid, 0, 0)))
				|| ((conveyor.image_speed > 0) && (!collision_rectangle(bbox_right, bbox_top+4, bbox_right, bbox_bottom-1, obj_solid, 0, 0)))
					x += conveyor.image_speed;
			}
		}
	#endregion
	
    //If the player is not swimming
    if (swimming == false) {
    
        //If the player is not sliding
        if (!sliding) {
    
            //If the player is not climbing
            if (state != playerstate.climb) {
        
                //Execute main behaviour script
                event_user(2);
				
				//Execute walljump behaviour script (If allowed)
				if (global.special_moves == true) then event_user(3);
				
				//Do not build P-Meter if you are using the tiny or mega powerup
				if (global.powerup != cs_tiny)
				&& (global.powerup != cs_mega) {
				
					//If the player is running on walls or ceilings
					if (global.mount != 2)
	                && (instance_number(obj_mario_wallrunner) == 1) {
                
	                    //If the P-Meter is full.
	                    if (pmeter > global.pmeter_limit) {      
                        
	                        //Keep P-Meter full.
	                        pmeter = global.pmeter_limit;
                    
	                        //Make the player able to run.
	                        run = true;
						
							//Play 'P-Meter' sound
							if (global.pmeter_sound == true)
							&& (!audio_is_playing(snd_pmeter))
								audio_play_sound(snd_pmeter, 0, true);
	                    }
                    
	                    //Otherwise, fill P-Meter
	                    else
	                        pmeter += 2;
	                }
                
	                //Otherwise...
	                else {
                
	                    //If the player's horizontal speed is equal/greater than 2.6 and it's not wearing a kuribo shoe.
	                    if (abs(xspeed) >= global.physics[global.player].phy_xspeed_max)
						&& (wallkick == 0)
	                    && (global.mount != 2)
	                    || (global.pwing == 1) {
                    
	                        //If the player is not jumping.
	                        if (state < playerstate.jump) {
                        
	                            //If the P-Wing is active
	                            if (global.pwing == 1) {
                            
	                                //Play 'P-Meter' sound
									if (global.pmeter_sound == true)
	                                && (!audio_is_playing(snd_pmeter)) {
                                
	                                    audio_play_sound(snd_pmeter, 0, true);
	                                    if (pmeter < global.pmeter_limit)
	                                        pmeter = global.pmeter_limit;
	                                }
	                            }
                            
	                            //Otherwise
	                            else {
                        
	                                //If the P-Meter is full.
	                                if (pmeter > global.pmeter_limit) {
                                    
	                                    //Keep P-Meter full.
	                                    pmeter = global.pmeter_limit;
                                
	                                    //Make the player able to run.
	                                    run = true;
									
										//Play 'P-Meter' sound
										if (global.pmeter_sound == true)
										&& (!audio_is_playing(snd_pmeter))
											audio_play_sound(snd_pmeter, 0, true);
	                                }
                                
	                                //Otherwise, fill P-Meter
	                                else
	                                    pmeter += 2;
	                            }
	                        }
                        
	                        //If the player is on the ground and not running.
	                        else if ((!run) && (freeze == false) && (pmeter > 0))
	                            pmeter--;
	                    }
                    
	                    //Otherwise, if the player's horizontal speed is lower than 2.6
	                    else if ((!run) || (oncloud == 1) || (wallkick > 0) || ((state < 2) && (abs(xspeed) < global.physics[global.player].phy_xspeed_max)) && (global.pwing == 0)) { 
                    
	                        //If the player is flying and lands on the floor.
	                        if (flying) {
                        
	                            //Stop 'P-Meter' sound
	                            audio_stop_sound(snd_pmeter);
								
								//Force reset P-Meter alarm
								alarm[11] = -1;
                            
	                            //Allow the player to fly again.
	                            flying = 0;
                            
	                            //Make the player walk
	                            run = false;
                            
	                            //Empty P-Meter
	                            if (pmeter > 0)
								&& (freeze == 0)
	                                pmeter--;
	                        }
                        
	                        //If the player is not flying.
	                        else if (!flying) {
                        
	                            //Stop 'P-Meter' sound
	                            audio_stop_sound(snd_pmeter);
                                                
	                            //Make the player walk
	                            run = false;
                            
	                            //Empty P-Meter
	                            if ((pmeter > 0) && (freeze == false))
	                                pmeter--;
	                        }   
	                    }
	                }
				}
				
				//Otherwise
				else {
					
                    //Stop 'P-Meter' sound
                    audio_stop_sound(snd_pmeter);
					
					//Stop flying
					flying = 0;
                                                                    
                    //Stop running
					run = false;
					
					//Decrement P-Meter
					if ((pmeter > 0) && (freeze == false))
						pmeter--;					
				}
            }
            
            //Otherwise, if the player is climbing.
            else if (state == playerstate.climb) {
            
                //Execute climb behaviour script
                event_user(4);
				
				//Check the climb surface
				var climbsurface = collision_rectangle(bbox_left, bbox_top+4, bbox_right, bbox_bottom, obj_climb, 0, 0);
				
				//If there's a climbable surface in position
				if (input_check_pressed(input.action_1))
				&& (netsmack == 0)
				&& (climbsurface)
				&& (climbsurface.image_xscale > 1) {
				
					//Play 'Bump' sound
					audio_play_sound(snd_bump, 0, false);
					
					//Increment netsmack
					netsmack = 4;
					
					//Reverse horizontal scale
					xscale = -xscale;
				}
                
                //Stop P-Meter if not permanent
                if (global.pwing == 0) {
                
                    //Stop 'P-Meter' sound
                    audio_stop_sound(snd_pmeter);
					
					//Stop flying
					flying = 0;
                                                                    
                    //Stop running
					run = false;
					
					//Decrement P-Meter
					if ((pmeter > 0) && (freeze == false))
						pmeter--;
                }
            }
        }
        
        //Otherwise, if the player is sliding down a slope
        else if (sliding == true) {
        
            //Execute slide behaviour script
            event_user(5);
            
            //Stop P-Meter if not permanent
            if (global.pwing == 0) {
                
                //Stop 'P-Meter' sound
                audio_stop_sound(snd_pmeter);
				
				//Stop flying
				flying = 0;
                                                                    
                //Stop running
				run = false;
					
				//Decrement P-Meter
				if ((pmeter > 0) && (freeze == false))
					pmeter--;
            }
        }
    }
    
    //Otherwise, if the player is actually swimming.
    else if (swimming) {
        
        //Execute swim behaviour script
        event_user(6);
            
		//Stop P-Meter if not permanent
		if (global.pwing == 0) {
                
		    //Stop 'P-Meter' sound
		    audio_stop_sound(snd_pmeter);
                                                                    
		    //Stop running
			run = false;
					
			//Stop flight
			flying = 0;
			
			//Decrement P-Meter
			if ((pmeter > 0) && (freeze == false))
				pmeter--;			
		}
    }
}
	
//If moving right
if (xspeed > 0) {
	
	//Check for a platform
	var rp = collision_rectangle(bbox_right, bbox_top+4, bbox_right+1, bbox_bottom-5, obj_platformparent, 1, 0);
	
	//If there's a wall on the right
	if ((global.powerup == cs_tiny) && (collision_rectangle(bbox_right, bbox_top+4, bbox_right+1, bbox_bottom-5, obj_solid, 1, 0))) 
	|| (((global.powerup != cs_tiny) && (collision_rectangle(bbox_right, bbox_top+4, bbox_right+1, bbox_bottom+ismega, obj_solid, 1, 0)))) {
		
		//Check for a block
		var block_r = collision_rectangle(bbox_right, y + 8, bbox_right+1, y + 8, obj_blockparent, 0, 0);
	
		//If Mario is sliding
		if (sliding == true) {
		
			//If the player has the shell powerup
			if (global.mount == 0)
			&& (global.powerup == cs_shell) {
			
				//Play 'Bump' sound
				audio_play_sound(snd_bump, 0, false);
				
				//Reverse horizontal speed
				xspeed = -xspeed;
				
				//Create effect
				instance_create_depth(x+5, y, depth - 1, obj_shellthump);
				
				//Bump block if there's one in position
				if ((block_r) && (block_r.ready == 0)) {
				
					with (block_r) {
						
						//Set state to bumped
						ready = 1;
						
						//Set horizontal speed
						hspeed = 2;
						alarm[0] = 4;
						
						//Create block specific events
						event_user(0);
						event_user(1);
					}
				}
				
				//Exit this event
				exit;
			}
			
			//Otherwise, stop sliding behaviour
			else				
				sliding = false;
		}
		
		//Stop horizontal movement
		xspeed = 0;
		
		//Prevent Mario from getting embed on a wall	
		while (collision_rectangle(bbox_right, bbox_top+4, bbox_right, bbox_bottom+ismega, obj_solid, 1, 0))
		&& (!collision_point(x, bbox_top+4, obj_solid, 0, 0))
			x--;
	}
	
	//If there's a platform
	else if ((rp) && (rp.issolid == true)) {
	
		//If Mario is sliding
		if (sliding == true) {
		
			//If the player has the shell powerup
			if (global.mount == 0)
			&& (global.powerup == cs_shell) {
			
				//Play 'Bump' sound
				audio_play_sound(snd_bump, 0, false);
				
				//Reverse horizontal speed
				xspeed = -xspeed;
				
				//Create effect
				instance_create_depth(x-5, y, depth - 1, obj_shellthump);
				
				//Exit this event
				exit;
			}
			
			//Otherwise, stop sliding behaviour
			else				
				sliding = false;
		}
		
		//Stop horizontal movement
		xspeed = 0;
		
		//Prevent Mario from getting embed on a wall			
		while (collision_rectangle(bbox_right, bbox_top+4, bbox_right, bbox_bottom+ismega, rp, 1, 0))
		&& (!collision_point(x, bbox_top+4, rp, 0, 0))
			x--;
	}
}
	
//Otherwise, if moving left
else if (xspeed < 0) {
	
	//Check for a platform
	var lp = collision_rectangle(bbox_left-1, bbox_top+4, bbox_left, bbox_bottom-5, obj_platformparent, 1, 0);
	
	//If there's a wall on the left
	if ((global.powerup == cs_tiny) && (collision_rectangle(bbox_left-1, bbox_top+4, bbox_left, bbox_bottom-5, obj_solid, 1, 0))) 
	|| (((global.powerup != cs_tiny) && (collision_rectangle(bbox_left-1, bbox_top+4, bbox_left, bbox_bottom+ismega, obj_solid, 1, 0)))) {
		
		//Check for a block
		var block_l = collision_rectangle(bbox_left-1, y + 8, bbox_left, y + 8, obj_blockparent, 0, 0);
	
		//If Mario is sliding
		if (sliding == true) {
		
			//If the player has the shell powerup
			if (global.mount == 0)
			&& (global.powerup == cs_shell) {
			
				//Play 'Bump' sound
				audio_play_sound(snd_bump, 0, false);
				
				//Reverse horizontal speed
				xspeed = -xspeed;
				
				//Create effect
				instance_create_depth(x-5, y, depth - 1, obj_shellthump);
				
				//Bump block if there's one in position
				if ((block_l) && (block_l.ready == 0)) {
				
					with (block_l) {
						
						//Set state to bumped
						ready = 1;
						
						//Set horizontal speed
						hspeed = -2;
						alarm[0] = 4;
						
						//Create block specific events
						event_user(0);
						event_user(1);
					}
				}
				
				//Exit this event
				exit;
			}
			
			//Otherwise, stop sliding behaviour
			else				
				sliding = false;
		}
		
		//Stop horizontal movement
		xspeed = 0;
			
		//Prevent Mario from getting embed on a ceiling
		while (collision_rectangle(bbox_left, bbox_top+4, bbox_left, bbox_bottom+ismega, obj_solid, 1, 0))
		&& (!collision_point(x, bbox_top+4, obj_solid, 0, 0))
			x++;
	}
	
	//If there's a platform
	else if ((lp) && (lp.issolid == true)) {
	
		//If Mario is sliding
		if (sliding == true) {
		
			//If the player has the shell powerup
			if (global.mount == 0)
			&& (global.powerup == cs_shell) {
			
				//Play 'Bump' sound
				audio_play_sound(snd_bump, 0, false);
				
				//Reverse horizontal speed
				xspeed = -xspeed;
				
				//Create effect
				instance_create_depth(x-5, y, depth - 1, obj_shellthump);
				
				//Exit this event
				exit;
			}
			
			//Otherwise, stop sliding behaviour
			else				
				sliding = false;
		}
		
		//Stop horizontal movement
		xspeed = 0;
		
		//Prevent Mario from getting embed on a wall			
		while (collision_rectangle(bbox_left, bbox_top+4, bbox_left, bbox_bottom+ismega, lp, 1, 0))
		&& (!collision_point(x, bbox_top+4, lp, 0, 0))
			x++;
	}
}
	
//If moving upwards
if (yspeed < 0)
&& (collision_rectangle(bbox_left, bbox_top - 1, bbox_right, bbox_top+4, obj_solid, 1, 0))
&& (!collision_point(x, y + 8, obj_mblock, 1, 0)) { 
		
	//Check for a block above
	var block_u = collision_rectangle(bbox_left, bbox_top - 1, bbox_right, bbox_top+4, obj_blockparent, 0, 0);
	
	//Check for a bridge above
	var bridge_u = collision_rectangle(bbox_left, bbox_top - 1, bbox_right, bbox_top+4, obj_platform_bridge, 0, 0);
	
	//Prevent the player from getting stuck on a ceiling when jumping/climbing
	if (state > playerstate.walk) {
			
		while (collision_rectangle(bbox_left, bbox_top - 1, bbox_right, bbox_top + 1, obj_solid, 1, 0))
			y++;
	}
		
	//Stop vertical movement
	if ((flying) && (global.powerup == cs_cape)) {
			
		if (yspeed < 0) {
				
			memory_yspeed = yspeed;
		}
	}
	yspeed = (block_u) ? -yspeed / 2 : 0;
		
	//Bump block if there's one in position
	if ((block_u) && (block_u.ready == 0)) {
				
		//With the block
		with (block_u) {
						
			//Set state to bumped
			ready = 1;
						
			//Set horizontal speed
			vspeed = -2;
			alarm[0] = 4;
						
			//Create block specific events
			event_user(0);
		}
	}
	
	//Bump bridge if there's one in position
	if ((bridge_u) && (bridge_u.image_speed == 0)) {
		
		with (bridge_u)
			event_user(0);
	}
		
	//If the player does not have the frog/penguin powerups and it's not climbing
	if ((state < 3)
	&& !(flying && global.powerup == cs_cape)
	&& (noisy == false)) {
		
		//Max out bee powerup flight timer
		if (global.powerup == cs_bee) {
			
			beefly = 128;
		}
			
		//Stop variable jump
		jumping = 2;
			
		//Play 'Bump' sound
		if (!audio_is_playing(snd_bump))
			audio_play_sound(snd_bump, 0, false);
	}
}
	
//Prevent the player from overlappin' the ceiling
if (state > playerstate.walk)
	while (collision_rectangle(bbox_left+1, bbox_top - yspeed / 2, bbox_right-1, bbox_top + 1, obj_solid, 1, 0))
	&& (!collision_point(x, y + 8, obj_solid, 1, 0))
		y++;
	
//If the player is not climbing
if (state != playerstate.climb) {
	
	//If the player controls are enabled and it's not jumping
	if (state != playerstate.jump)
	&& (sliding == false)
	&& (groundpound == 0)
	&& (enable_control == true) {
		
		//Make the player crouch down when the 'Down' key is held
		if (input_check(input.down))
		&& (global.powerup != cs_tiny)
		&& (global.powerup != cs_frog)
		&& (global.powerup != cs_mega)
		&& (crouch == false)
		&& (noisy == false)
			crouch = true;
				
		//Otherwise, if the 'Down' key is no longer pressed
		else if (!input_check(input.down))
			crouch = false;
	}
		
	// Handles powerup specific projectiles, tail spin, cat scratching, etc...
	if (input_check_pressed(input.action_1))
	&& (obj_levelcontrol.barrier == true)
	&& (enable_control == true)
		timer(throw_projectile, 1, false);			
}

//Otherwise, cancel crouch and spin jump
else {
    
    //Make the player get up
    crouch = false;
        
    //Stop special jump
    jumpstyle = 0;
}
    
//If the player is not swimming and makes contact with a water surface
if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 1, 0))
&& (swimming == false) {
        
    //Make the player swim.
    swimming = 1;
    swimtype = 0;
		
	// Make the player stop running so that the p-meter drains
	run = false;
        
    //Make the player get up
    crouch = false;
	
	//If moving down
	if (yspeed > 0) {
        
		//Stop vertical movement
		yspeed = 0;
		yadd = 0;
		
		//Stop most horizontal movement
		xspeed = xspeed/2.5;
			
		//Create a splash effect	
		with (instance_create_depth(x, y-15, -4, obj_smoke))
			sprite_index = spr_splash;
	}
}
    
//Otherwise, if the player had enough swimming and wants to get out
else if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 1, 0)) 
&& (swimming)
&& (!collision_rectangle(bbox_left, bbox_top-1, bbox_right, bbox_top, obj_solid, 1, 0))
&& (!collision_rectangle(bbox_left, bbox_top-1, bbox_right, bbox_bottom, obj_water_geyser, 0, 0)) {
            
    //If moving up
	if (yspeed < 0)
	&& (input_check(input.action_0)) {
                
	    //Switch between powerups
		switch (global.powerup) {
						
			case (cs_tiny):
				audio_play_sound(snd_jump_tiny, 0, false);
				break;
						
			default: 
				audio_play_sound(snd_jump, 0, false);
				break;
		}
                    
	    //Make the player not swim
	    swimming = false;
                    
	    //Allow variable jump
	    jumping = 1;
			
		//Set vertical speed
		yspeed = (global.powerup != cs_tiny) ? -global.physics[global.player].phy_jump + abs(xspeed)/7.5*-1 : -global.physics[global.player].phy_jump_tiny + abs(xspeed)/7.5*-1;
                    
	    //Create splash effect
		if (!collision_rectangle(bbox_left-2, bbox_top+4, bbox_right+2, bbox_bottom, obj_waterfall, 0, 0)) {
						
			with (instance_create_depth(x, bbox_top-15, -4, obj_smoke))
				sprite_index = spr_splash;
		}
	}
	
	//Otherwise
	else {
	
		if (yspeed < 0)
			yspeed = 0;
	}
}

#region SWIM END

	//If Mario is swimming and there's no water above
	if (swimming)
	&& (!collision_rectangle(bbox_left, bbox_top+1, bbox_right, bbox_top+1, obj_swim, 0, 0)) {
	
		//If moving down...
		if (yspeed > 0)
	
		//...or there's no vertical movement, force end swimming
		|| ((yspeed == 0) && (state < playerstate.jump))
			swimming = false;
	}

#endregion
	
//If the player gets stuck in a wall
if (yspeed == 0)
&& (crouch == false) 
&& (mask_index == spr_mask_mario_big) {
	
    //If the player gets stuck
    if (collision_rectangle(bbox_left, bbox_top+4, bbox_right, bbox_top+4, obj_solid, 1, 0))
	&& (!collision_rectangle(bbox_left, bbox_top+4, bbox_right, bbox_bottom, obj_mblock, 1, 0))
    && (inwall == 0) {
        
        //If the direction was not set
        if (direct2 == 0) {
            
            //Set it up
            direct2 = xscale;
        }
            
        //Begin movement
        inwall = 1;
            
        //Set the movement direction
        direct = -direct2;
    }
        
    //Otherwise, if the player gets stuck on a wall.
    else if (inwall == 1) {
            
        //Move the player until it's not embed in a wall.
        x += 1*sign(direct);       
            
        //If the player is not longer embed on a wall, make him able to move.
        if (!collision_rectangle(bbox_left, bbox_top+4, bbox_right, bbox_bottom, obj_solid, 1, 0)) {
            
            inwall = 0;
            direct2 = 0;
        }
            
        //If the player collides with a wall while being stuck
        if ((direct == -1) && (collision_line(bbox_left, y+4, bbox_left, bbox_bottom-4, obj_solid, 1, 0)))
        || ((direct == 1) && (collision_line(bbox_right, y+4, bbox_right, bbox_bottom-4, obj_solid, 1, 0)))
            direct = -direct;
    }		
}
    
//Prevent the player from going too high on the level
if (y < -96)
    y = -96;
        
//Otherwise, if he is falling.
else {
    
    //If the player is below the bottom room boundary and didn't activate a warp, restart the room.
    if (bbox_top > room_height+32) {
                    
        if (!instance_exists(obj_pitwarp)) {
            
            instance_create_depth(x, y, depth, obj_mario_dead);
            instance_destroy();
            exit;  
        }
            
        else {
				
			//Temporary variable
			var _dest = obj_pitwarp.destination;
            
			//Set exit type
			global.postchange = 0;

			//Set warp id
			global.exit_id = obj_pitwarp.exit_id;

			//If no curtain exists
			if (instance_number(obj_fade_in) == 0) {
	
				with (instance_create_depth(0, 0, -100, obj_fade_in))
					target = _dest;
			}
        }       
    }
}

//Handle tail whip animation
if ((state == playerstate.jump) && (wiggle > 0))
    wiggle--;
else
    wiggle = 0;