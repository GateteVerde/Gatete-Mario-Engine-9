/// @description Spawn if inside the coordinates

//If Mario does exist
if (instance_exists(obj_mario)) {

	//If Mario is inside the region
	if (obj_mario.x > xmin) 
	&& (obj_mario.x < xmax) {
	
		//If the Silver P-Switch is active and Mario is not transforming
		if (obj_levelcontrol.gswitch_on == true) 
		|| (instance_exists(obj_mario_transform)) {
		
			//Hold event
			alarm[0] = 1;
			exit;
		}
		
		//Play 'Thud' sound
		audio_play_sound(snd_thud, 0, false);
		
		//Repeat
		alarm[0] = 200;
		
		//If the bullets appear horizontally
		if (spawn_type = "Horizontal") {
		
			//If the bill will fly to the right
			if (direct == 1) {
			
				//Create bullet bill
                with (instance_create_depth(camera_get_view_x(view_camera[0]) - 8, camera_get_view_y(view_camera[0]) + random_range(32, global.gh - 32), -2, obj_bulletbill)) {
                
					image_index = 0;
					xspeed = 2;
                }
			}
			
			//Otherwise, if the bill will fly to the left
			else if (direct == -1) {
			
				//Create bullet bill
                with (instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 8, camera_get_view_y(view_camera[0]) + random_range(32, global.gh - 32), -2, obj_bulletbill)) {
                
					image_index = 4;
					xspeed = -2;
                }				
			}
			
			//Set opposite direction
			direct = -direct;
		}
		
		//Otherwise, if the bullets appear both Horizontally and Vertically
		else if (spawn_type = "Horizontal / Vertical") {
		
			//Horizontal
			#region
				
				//Temporary y variable
				var yy = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2) - 8;
				
				//If the bill will fly to the right
				if (direct == 1) {
			
					//Create bullet bill
		            with (instance_create_depth(camera_get_view_x(view_camera[0]) - 8, yy - 48, -2, obj_bulletbill)) {
                
						image_index = 0;
						xspeed = 2;
		            }
					
					//Create bullet bill
		            with (instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 8, yy, -2, obj_bulletbill)) {
                
						image_index = 4;
						xspeed = -2;
		            }
					
					//Create bullet bill
		            with (instance_create_depth(camera_get_view_x(view_camera[0]) - 8, yy + 48, -2, obj_bulletbill)) {
                
						image_index = 0;
						xspeed = 2;
		            }
				}
			
				//Otherwise, if the bill will fly to the left
				else if (direct == -1) {
			
					//Create bullet bill
		            with (instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 8, yy - 48, -2, obj_bulletbill)) {
                
						image_index = 4;
						xspeed = -2;
		            }
					
					//Create bullet bill
		            with (instance_create_depth(camera_get_view_x(view_camera[0]) - 8, yy, -2, obj_bulletbill)) {
                
						image_index = 0;
						xspeed = 2;
		            }
					
					//Create bullet bill
		            with (instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 8, yy + 48, -2, obj_bulletbill)) {
                
						image_index = 4;
						xspeed = -2;
		            }
				}
			
				//Set opposite direction
				direct = -direct;
			#endregion
			
			//Vertical
			#region
			
				//Create bullet bill
				with (instance_create_depth(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2) - global.gw / 4, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), -2, obj_bulletbill)) {
				
					image_index = 2;
					yspeed = -2;
				}
				
				//Create bullet bill
				with (instance_create_depth(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2) + global.gw / 4, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), -2, obj_bulletbill)) {
				
					image_index = 2;
					yspeed = -2;
				}
			#endregion
		}
		
		//Otherwise, if the bullet bills appear diagonally
		else if (spawn_type == "Diagonal") {
		
			//Create bullet bill
			with (instance_create_depth(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2) - 128, camera_get_view_y(view_camera[0]) - 16, -2, obj_bulletbill)) {
				
				image_index = 7;
				xspeed = 2;
				yspeed = 2;
			}
			
			//Create bullet bill
			with (instance_create_depth(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2) + 128, camera_get_view_y(view_camera[0]) - 16, -2, obj_bulletbill)) {
				
				image_index = 5;
				xspeed = -2;
				yspeed = 2;
			}
			
			//Create bullet bill
			with (instance_create_depth(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2) - 128, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), -2, obj_bulletbill)) {
				
				image_index = 1;
				xspeed = 2;
				yspeed = -2;
			}
			
			//Create bullet bill
			with (instance_create_depth(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2) + 128, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), -2, obj_bulletbill)) {
				
				image_index = 3;
				xspeed = -2;
				yspeed = -2;
			}
		}
	}
	
	//Otherwise
	else {
	
		//Hold event
		alarm[0] = 1;
		exit;
	}
}

//Otherwise
else {

	//Hold event
	alarm[0] = 1;
	exit;
}
