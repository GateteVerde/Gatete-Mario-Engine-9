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
			
            obj_hud_map.levelname = string(panel.levelname);
			obj_hud_map.levelprint = string(panel.levelprint);
			obj_hud_map.levelid = string(panel.levelid);
		}
        else {
			
            obj_hud_map.levelname = "";
			obj_hud_map.levelprint = ".";
			obj_hud_map.levelid = noone;
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
			if (input_check_pressed(input.action_1)) {
			
				//Play 'Inventory' sound
				audio_play_sound(snd_inventory, 0, false);
				
				//Open inventory
				inventory = 1;
				
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
            
	            //The player is ready
	            is_ready = 1;
                
	            //Stop music
	            obj_mapcontrol.alarm[1] = 1;
                
	            //Go to the stage
	            panel.alarm[1] = 1;
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