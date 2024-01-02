/// @description Map player logic

//Check for a node
node = collision_point(x+xorig, y+yorig, obj_node, 0, 0);

//If the player is not moving
if (status == mapstate.idle) 
|| (status == mapstate.wait) 
|| (status == mapstate.preidle) {

    //Check for a panel
    panel = collision_point(x+xorig, y+yorig, obj_levelpanel, 0, 0);
    
    //If the map HUD exists
    if (instance_exists(obj_hud_map)) {
    
        //If there's a panel, print the name on the HUD
        if (panel) {
			
            obj_hud_map.levelname = string_upper(panel.levelname);
			obj_hud_map.levelid = panel.levelid;
		}
        else {
			
			//Forget level ID
			obj_hud_map.levelid = noone;
			
			//If Mario is at the start position on the map and there's no panel
			if (!panel)
			&& (x == xstart)
			&& (y == ystart)
				obj_hud_map.levelname = string_upper("Start");
			else
				obj_hud_map.levelname = "";
		}
    }	
    
    //Do not allow movement if there's paths opening or if Mario is on the wait state
	if (status != mapstate.preidle)
    && (is_ready == 0)
	&& (audio_is_playing(global.mapstream))
    && (instance_number(obj_mapopener) == 0) {

		//If the inventory is not opened
		if (inventory == 0) {
			
			//Open the inventory
			if (input_check_pressed(input.action_2)) {
			
				//Play 'Inventory' sound
				audio_play_sound(snd_inventory, 0, false);
				
				//Force set wait status
				status = mapstate.wait;
				
				//Open inventory
				inventory = 1;
				
				//Set selection
				if (global.inventory[0] == 0)
					boxselection = 0;
				else
					boxselection = 1;
			}
			
			#region DEBUG KEYS
			
				//Open adyacent paths (Do disable this on your game)
				if (input_check_pressed(vk_backspace))
					event_user(15);
				
			#endregion
    
	        //Moving upwards
	        if ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) {
            
	            //Check for a path above
	            var pathU = collision_point(x+xorig, y+yorig-8, obj_pathparent, 0, 0);
            
	            //If there's a path above and it is visible
	            if (pathU) 
	            && (pathU.image_alpha == 1) {
                
	                direct = 90;
	                status = mapstate.walk;
	            }
	        }
            
	        //Moving downwards
	        else if ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5)) {
            
	            //Check for a path above
	            var pathD = collision_point(x+xorig, y+yorig+9, obj_pathparent, 0, 0);
            
	            //If there's a path above and it is visible
	            if (pathD) 
	            && (pathD.image_alpha == 1) {
                
	                direct = 270;
	                status = mapstate.walk;
	            }
	        }
            
	        //Moving to the left
	        else if ((input_check(input.left)) || (gamepad_axis_value(0, gp_axislh) < -0.5)) {
            
	            //Check for a path above
	            var pathL = collision_point(x+xorig-8, y+yorig, obj_pathparent, 0, 0);
            
	            //If there's a path above and it is visible
	            if (pathL) 
	            && (pathL.image_alpha == 1) {
                
	                direct = 180;
	                status = mapstate.walk;
	            }
	        }
            
	        //Moving to the right
	        else if ((input_check(input.right)) || (gamepad_axis_value(0, gp_axislh) > 0.5)) {
            
	            //Check for a path above
	            var pathR = collision_point(x+xorig+9, y+yorig, obj_pathparent, 0, 0);
            
	            //If there's a path above and it is visible
	            if (pathR) 
	            && (pathR.image_alpha == 1) {
                
	                direct = 0;
	                status = mapstate.walk;
	            }
	        }
            
	        //If there's a panel and this panel is available        
	        if (panel)
	        && (panel.beaten < 2)
	        && (status == mapstate.idle)
	        && (input_check_pressed(input.action_0)) {
            
	            //Play 'Enter Stage' sound
	            audio_play_sound(snd_enterstage, 0, false);
				
				//Stop music
	            obj_mapcontrol.alarm[1] = 1;
            
	            //The player is ready
	            is_ready = 1;
                
	            //Go to the stage
				with (panel) {
					
					event_user(0);
					alarm[1] = 1;
				}
	        }
			
			//Change player
			if (status == mapstate.idle)
			&& (input_check_pressed(input.action_1)) {
			
				//Play 'Character Swap' sound
				audio_play_sound(snd_character_swap, 0, false);
				
				//Create 'Smoke' effect
				instance_create_depth(x+8, y+8, -6, obj_smoke);
				
				//Change player and replace sprites
				global.player = !global.player;
				index_powerups();
			}
		}
			
		//Otherwise, if it is opened
		else if (inventory == 1) {
			
			//Close inventory
			if (input_check_pressed(input.action_1))
			|| (input_check_pressed(input.action_2)) {
			
				//Play 'Inventory' sound
				audio_play_sound(snd_inventory, 0, false);
				
				//Open inventory
				inventory = 0;
				
				//Force set wait status
				status = mapstate.idle;
			}
			
			//If there's items on the inventory
			if (boxselection != 0) {
			
				//If the 'Confirm' key is pressed
				if (input_check_pressed(input.action_0)) {
					
					//If the powerup select is not the tiny shroom, golden flower, starman or pwing
					if (global.inventory[boxselection] < cs_tiny) {
						
						//If a P-Wing is active
						if (global.pwing == 0) 
						&& (global.powerup != cs_tiny) 
						&& (global.powerup != cs_gold) {
							
							//Play 'Powerup' sound
							audio_play_sound(snd_powerup, 0, false);
								
							//Remember previous powerup
							var previous = global.powerup;
								
							//Get powerup
							global.powerup = global.inventory[boxselection];
								
							//If Mario does not have a powerup
							if (previous == 0) {
								
								//Shift the inventory items over by one
				                for (var i = boxselection; i < global.inventory[0]; i++) {
                        
				                    global.inventory[i] = global.inventory[i+1];
				                }
                            
				                //Subtract from the number of items in the inventory
				                global.inventory[0]--;
							}
								
							//Otherwise
							else {
								
								global.inventory[boxselection] = previous;
							}
							
							//Finish item retrieval
							inventory = 0;
							status = mapstate.idle;
							
							//Force display powerup on HUD
							with (obj_hud_map) {
							
								prompt = 0;
								alarm[0] = 180;
							}
						}
							
						//Otherwise, play 'Wrong' sound
						else
							audio_play_sound(snd_wrong, 0, false);
					}
				
					//Otherwise, if the item selected is a tiny shroom
					else if (global.inventory[boxselection] == cs_tiny) {
					
						//If Mario does not have the tiny or gold or p-wing active
						if (global.pwing == 0)
						&& (global.powerup != cs_tiny) 
						&& (global.powerup != cs_gold) {
						
							//Play 'Powerup' sound
							audio_play_sound(snd_mini, 0, false);
						
							//Give Mario the Tiny powerup if we didn't
				            global.powerup = cs_tiny;
							
							//Shift the inventory items one by one
							for (var i = boxselection; i < global.inventory[0]; i++) {
							
								global.inventory[i] = global.inventory[i+1];
							}
							
							//Subtract from the number of items in the inventory
				            global.inventory[0]--;
							
							//Finish item retrieval
							inventory = 0;
							status = mapstate.idle;
							
							//Force display powerup on HUD
							with (obj_hud_map) {
							
								prompt = 0;
								alarm[0] = 180;
							}
						}
						
						//Otherwise, play 'Wrong' sound
						else
							audio_play_sound(snd_wrong, 0, false);
					}
					
					//Otherwise, if the item selected is a gold flower
					else if (global.inventory[boxselection] == cs_gold) {
					
						//If Mario does not have the tiny or gold or p-wing active
						if (global.pwing == 0)
						&& (global.powerup != cs_tiny) 
						&& (global.powerup != cs_gold) {
						
							//Play 'Powerup' sound
							audio_play_sound(snd_powerup, 0, false);
						
							//Give Mario the Gold powerup if we didn't
				            global.powerup = cs_gold;
							
							//Shift the inventory items one by one
							for (var i = boxselection; i < global.inventory[0]; i++) {
							
								global.inventory[i] = global.inventory[i+1];
							}
							
							//Subtract from the number of items in the inventory
				            global.inventory[0]--;
							
							//Finish item retrieval
							inventory = 0;
							status = mapstate.idle;
							
							//Force display powerup on HUD
							with (obj_hud_map) {
							
								prompt = 0;
								alarm[0] = 180;
							}
						}
						
						//Otherwise, play 'Wrong' sound
						else
							audio_play_sound(snd_wrong, 0, false);
					}
					
					//Otherwise, if the item selected is a star
					else if (global.inventory[boxselection] == cs_starman) {
					
						//If the Starman is not active
						if (global.mapstar == false) {
						
							//Play 'Powerup' sound
							audio_play_sound(snd_powerup, 0, false);
						
							//Give Mario star power on the next level if we didn't.
				            global.mapstar = true;
							
							//Shift the inventory items one by one
							for (var i = boxselection; i < global.inventory[0]; i++) {
							
								global.inventory[i] = global.inventory[i+1];
							}
							
							//Subtract from the number of items in the inventory
				            global.inventory[0]--;
							
							//Finish item retrieval
							inventory = 0;
							status = mapstate.idle;
							
							//Force display powerup on HUD
							with (obj_hud_map) {
							
								prompt = 0;
								alarm[0] = 180;
							}
						}
						
						//Otherwise, play 'Wrong' sound
						else
							audio_play_sound(snd_wrong, 0, false);
					}
					
					//Otherwise, if the item selected is a P-Wing
					else if (global.inventory[boxselection] == cs_pwing) {
					
						//If Mario does not have the tiny or gold or p-wing active
						if (global.pwing == 0)
						&& (global.powerup != cs_tiny) 
						&& (global.powerup != cs_gold) {
						
							//Play 'Powerup' sound
							audio_play_sound(snd_powerup, 0, false);
						
							//Give Mario unlimited flight
				            global.pwing = true;
							
							//Give Mario the leaf powerup
							if (global.powerup != cs_raccoon)
							&& (global.powerup != cs_tanooki)
							&& (global.powerup != cs_fraccoon)
							&& (global.powerup != cs_iraccoon)
								global.powerup = cs_raccoon
							
							//Shift the inventory items one by one
							for (var i = boxselection; i < global.inventory[0]; i++) {
							
								global.inventory[i] = global.inventory[i+1];
							}
							
							//Subtract from the number of items in the inventory
				            global.inventory[0]--;
							
							//Finish item retrieval
							inventory = 0;
							status = mapstate.idle;
							
							//Force display powerup on HUD
							with (obj_hud_map) {
							
								prompt = 0;
								alarm[0] = 180;
							}
						}
						
						//Otherwise
						else
							audio_play_sound(snd_wrong, 0, false);
					}
				}
				
				//If the 'Left' key is pressed, move one item to the left
				else if ((input_check_pressed(input.left)) || (gamepad_axis_value(0, gp_axislh) < -0.5)) {
				
					//Play 'Move' sound
					audio_play_sound(snd_move, 0, false);
				
					//If there's items on the inventory
					if (boxselection > 1)
					&& (global.inventory[0] != 0)
				        boxselection--;
					else
						boxselection = global.inventory[0];
				}
        
				//If the 'Right' key is pressed, move one item to the right
				else if ((input_check_pressed(input.right)) || (gamepad_axis_value(0, gp_axislh) > 0.5)) {
				
					//Play 'Move' sound
					audio_play_sound(snd_move, 0, false);
				
					//If there's items on the inventory
					if (boxselection < global.inventory[0])
				        boxselection++;
					else
						boxselection = 1;
				}
			}
		}
    }
}

//Otherwise, if the player is moving
else if (status == mapstate.walk) {

    //Update steps
    step += spd;
    while (step >= 1) {
    
        //Travel through paths
        if (collision_point(x+xorig+cos(degtorad(direct)), y+yorig-sin(degtorad(direct)), obj_pathparent, 1, 0)) {
        
            x += cos(degtorad(direct));
            y += -sin(degtorad(direct));
        }
        else if (collision_point(x+xorig+cos(degtorad(direct))-sin(degtorad(direct)), y+yorig-sin(degtorad(direct))-cos(degtorad(direct)), obj_pathparent, 1, 0)) {
        
            x += cos(degtorad(direct))-sin(degtorad(direct));
            y += -sin(degtorad(direct))-cos(degtorad(direct));
        }
        else if (collision_point(x+xorig+cos(degtorad(direct))+sin(degtorad(direct)), y+yorig-sin(degtorad(direct))+cos(degtorad(direct)), obj_pathparent, 1, 0)) {
        
            x += cos(degtorad(direct))+sin(degtorad(direct));
            y += -sin(degtorad(direct))+cos(degtorad(direct));
        }
        else if (collision_point(x+xorig-sin(degtorad(direct)), y+yorig-cos(degtorad(direct)), obj_pathparent, 1, 0)) {
        
            x += -sin(degtorad(direct));
            y += -cos(degtorad(direct));
            direct += 90;
        }
        else if (collision_point(x+xorig+sin(degtorad(direct)), y+yorig+cos(degtorad(direct)), obj_pathparent, 1, 0)) {
        
            x += sin(degtorad(direct));
            y += cos(degtorad(direct));
            direct -= 90;
        }
        else 
            direct += 180;
        
        //Reset angles
        if (direct < 0) then direct += 360;
        if (direct >= 360) then direct -= 360;
        
        //Stop when inside a node
        node = collision_point(x+xorig, y+yorig, obj_node, 0, 0);
        
        //If there's a node
        if (node) {
        
            //If the player is at the center of the node
            if (x+xorig == node.x+7)
            && (y+yorig == node.y+7) {
            
                //Play 'Move' sound
                audio_play_sound(snd_move, 0, false);
            
                //Set stop state
                status = mapstate.preidle;
                
                //Wait to be able to walk again
                alarm[11] = 8;
                
                //Reset steps
                step = 0;
                
                //Exit
                exit;
            }
        }
        
        //Update step
        step--;
    }
            
    //Update spd
    if (is_climbing == false)
        spd = 2;
    else
        spd = 1;
}

//Check for a climbing object
if (collision_point(x+xorig, y+yorig, obj_climb, 0, 0))
    is_climbing = true;
else
    is_climbing = false;