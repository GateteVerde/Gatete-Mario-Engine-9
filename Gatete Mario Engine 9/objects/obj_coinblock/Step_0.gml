/// @description Coin Challenge Block logic

//If gravity is ever activated 
if (ready2 == 1) {

	//Plummet to where it splits open
	if (y > camera_get_view_y(view_camera[0]) + global.gh - 30) {
		
		//Play 'Spin Stomp' sound
		audio_play_sound(snd_spinstomp, 0, false);

		#region ENABLE MARIO AND NPCs
		
			//Make all objects under obj_physicsparent resume movement
			with (obj_physicsparent) event_user(14);

			//If the player is not riding anything
			if (global.mount == 0) {
	
				//If Mario exists
				if (instance_exists(obj_mario)) {
    
				    //If the player is pulling an item, make said object visible
				    if (instance_exists(obj_puller))    
				        obj_puller.visible = true;
        
				    //Otherwise, if the wallrunner exists make said object visible
				    else if (instance_exists(obj_wallrunner))    
				        obj_wallrunner.visible = true;
        
				    //Otherwise, make the main player visible
				    else {
			
						//Un-freeze
						with (obj_mario) {
				
							event_user(14);
							enable_control = true;
						}

						//Set depth and alpha
						obj_mario.depth = -5;
				        obj_mario.image_alpha = 1;
					}
				}
			}
    
			//If the player is riding a yoshi, make yoshi visible.
			if (global.mount == 1) {
	
				//Make Yoshi visible
			    obj_yoshi.visible = true;
	
				//Un-freeze
				with (obj_mario) {
				
					event_user(14);
					enable_control = true;
				}	
			}

			//Otherwise, if the player is riding a kuribo shoe, make the kuribo shoe visible.
			else if (global.mount == 2) {
	
				//Make the kuribo shoe visible
			    obj_kuriboshoe.visible = true;
	
				//Un-freeze
				with (obj_mario) {
				
					event_user(14);
					enable_control = true;
				}	
			}
		#endregion

		//Smoke
		for (var i = 0; i < 3; i++) {
		
			instance_create_depth(camera_get_view_x(view_camera[0]) + 12 + (i * 16), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16, -32, obj_smoke)
		}

		//Collect Mode
		with (obj_hud) {
			
			collect_mode = 1;
			coins_left = other.coins;
		}

		//Destroy this object
		instance_destroy();
	}
}