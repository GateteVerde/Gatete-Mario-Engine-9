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
			
			//If Mario is at the start position
			if (position_meeting(x + 8, y + 8, obj_mapstart))
			&& (position_meeting(x + 8, y + 8, obj_mapstart).visible = true)
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
				
				//Open inventory
				inventory = 1;
				
				//Set selection
				boxselection = 0;
				
				//Force set wait status
				status = mapstate.wait;
			}
    
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
			
			//Otherwise, if there is a item to select
			else {
			
				//If the 'Confirm' key is pressed
				if (input_check_pressed(input.action_0)) {
					
					switch (boxselection) {
					
						//Mini Mushroom
						case (0): {
								
							//If Mario does have the P-Wing or the mini form
							if (global.pwing == true)
							|| (global.powerup == cs_gold)
								audio_play_sound(snd_wrong, 0, false);
									
							//Otherwise
							else {
								
								//If there's mushrooms in the inventory
								if (global.inventory[0] > 0) {
									
									//If Mario does have the Mushroom powerup
									if (global.powerup != cs_tiny) {
										
										//Play 'Powerup' sound
										audio_play_sound(snd_mini, 0, false);
							
										//Set powerup
										global.powerup = cs_tiny;
							
										//Subtract one unit
										global.inventory[0]--;
							
										//Close inventory and allow Mario to move
										inventory = 0;
										status = mapstate.idle;
									}
									else
										audio_play_sound(snd_wrong, 0, false);
								}
								else
									audio_play_sound(snd_wrong, 0, false);	
							}
						} break;
						
						//Mushroom
						case (1): {
						
							//If Mario does have the P-Wing or the Mini form
							if (global.pwing == true)
							|| (global.powerup == cs_gold)
								audio_play_sound(snd_wrong, 0, false);

							//Otherwise
							else {
									
								//If there's mushrooms in the inventory
								if (global.inventory[1] > 0) {
									
									//If Mario does is small
									if (global.powerup == cs_small) {
										
										//Play 'Powerup' sound
										audio_play_sound(snd_powerup, 0, false);
							
										//Set powerup
										global.powerup = cs_big;
							
										//Subtract one unit
										global.inventory[1]--;
							
										//Close inventory and allow Mario to move
										inventory = 0;
										status = mapstate.idle;
									}
									else
										audio_play_sound(snd_wrong, 0, false);
								}
								else
									audio_play_sound(snd_wrong, 0, false);
							}	
						} break;
							
						//Gold
						case (24): {
							
							//If there's a P-Wing active
							if (global.pwing == true)
								audio_play_sound(snd_wrong, 0, false);
								
							//Otherwise
							else {
								
								//If Mario has used a gold flower already
								if (global.powerup == cs_gold)
									audio_play_sound(snd_wrong, 0, false);
									
								//Otherwise
								else {
									
									//If there's stars on the inventory
									if (global.inventory[24] > 0) {
										
										//Play 'Powerup' sound
										audio_play_sound(snd_powerup, 0, false);
										
										//Use a start when level begins
										global.powerup = cs_gold;
										
										//Subtract one unit
										global.inventory[24]--;
										
										//Close inventory and allow Mario to move
										inventory = 0;
										status = mapstate.idle;
									}
									else
										audio_play_sound(snd_wrong, 0, false);
								}
							}
						} break;
							
						//Star
						case (25): {
								
							//If Mario has used a star already
							if (global.mapstar == true)
								audio_play_sound(snd_wrong, 0, false);

							//Otherwise
							else {
								
								//If there's stars on the inventory
								if (global.inventory[25] > 0) {
										
									//Play 'Powerup' sound
									audio_play_sound(snd_powerup, 0, false);
										
									//Use a start when level begins
									global.mapstar = true;
										
									//Subtract one unit
									global.inventory[25]--;
										
									//Close inventory and allow Mario to move
									inventory = 0;
									status = mapstate.idle;
								}
								else
									audio_play_sound(snd_wrong, 0, false);
							}
						} break;
							
						//P-Wing
						case (26): {
							
							//If Mario does not have the gold powerup
							if (global.powerup == cs_gold)
								audio_play_sound(snd_wrong, 0, false);
							
							//Otherwise
							else {
								
								//If Mario has used a p-wing already
								if (global.pwing == true)
									audio_play_sound(snd_wrong, 0, false);

								//Otherwise
								else {
								
									//If there's stars on the inventory
									if (global.inventory[26] > 0) {
										
										//Play 'Powerup' sound
										audio_play_sound(snd_powerup, 0, false);
										
										//Begin with P-Meter full
										global.pwing = true;
										
										//Set up 'Raccoon' powerup
										if (global.powerup != cs_raccoon) {
										
											global.powerup = cs_raccoon;
										}
										
										//Subtract one unit
										global.inventory[26]--;
										
										//Close inventory and allow Mario to move
										inventory = 0;
										status = mapstate.idle;
									}
									else
										audio_play_sound(snd_wrong, 0, false);
								}
							}
						} break;
							
						//Rest of Powerups
						default: {
								
							//If Mario does have the P-Wing or the Mini form
							if (global.pwing == true)
							|| (global.powerup == cs_gold)
								audio_play_sound(snd_wrong, 0, false);

							//Otherwise
							else {
									
								//If there's powerups in the inventory
								if (global.inventory[boxselection] > 0) {
									
									//If Mario does have a powerup minor than a fireflower
									if (global.powerup < cs_fire) {
										
										//Play 'Powerup' sound
										audio_play_sound(snd_powerup, 0, false);
							
										//Set powerup
										global.powerup = boxselection+1;
							
										//Subtract one unit
										global.inventory[boxselection]--;
							
										//Close inventory and allow Mario to move
										inventory = 0;
										status = mapstate.idle;
									}
									
									//Otherwise
									else
										audio_play_sound(snd_wrong, 0, false);
								}
								else
									audio_play_sound(snd_wrong, 0, false);
							}																	
						} break;
					}
				}
				
				//If the 'Left' key is pressed, move one item to the left
				else if ((input_check_pressed(input.left)) || (gamepad_axis_value(0, gp_axislh) < -0.5)) {
        
				    //Play 'Move' sound
					audio_play_sound(snd_move, 0, false);
					
					//Set cursor position
					boxselection--;
					if (boxselection < 0)
						boxselection = 26;
				}
        
				//If the 'Right' key is pressed, move one item to the right
				else if ((input_check_pressed(input.right)) || (gamepad_axis_value(0, gp_axislh) > 0.5)) {
            
				    //Play 'Move' sound
					audio_play_sound(snd_move, 0, false);
					
					//Set cursor position
					boxselection++;
					if (boxselection > 26)
						boxselection = 0;
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
                alarm[11] = 20;
                
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