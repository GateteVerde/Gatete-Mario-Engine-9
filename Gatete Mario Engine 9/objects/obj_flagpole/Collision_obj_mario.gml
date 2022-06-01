/// @description Turn the player into the player goal object

//If Mario is below the flagpole top
if (other.bbox_bottom > bbox_top+8) {

	//If Mario has the giant powerup and he's exactly at the 
	if (((other.xspeed > 0) && (other.x > x+8)) || ((other.xspeed < 0) && (other.x < x+8)))
	&& (global.powerup == cs_mega) 
	&& (instance_number(obj_mario_transform) == 0) {
	
		//Play 'Warp' sound
		audio_play_sound(snd_warp, 0, false);
	
		//Stop all music and fanfares
		with (obj_levelcontrol) {
	
			event_user(0);
			alarm[2] = -1;
		}
	
		//Destroy megashroom timer
		with (obj_megashroom_timer) instance_destroy();
	
		//Create transformation object
		with (instance_create_depth(x+8, other.y, -5, obj_mario_transform)) {
	
			sprite_index = global.goal_sprite[cs_big];
			image_xscale = 4;
			image_speed = 0;
			image_index = 0;
			sequence = 6;
		}
	}

	//Otherwise
	else if (global.powerup != cs_mega) 
	&& (!instance_exists(obj_mario_transform)) {

		//Create goal player
		with (instance_create_depth(x+8, other.y, -5, obj_mario_flagpole)) {
		
			//Set the facing direction
			image_xscale = obj_mario.xscale;
    
			//Set up the id of this flagpole
			flagpole = other.id;
        
			//Make the flag detach
			with (other.flag) {
		
				event_user(0);
			}
		}
    
		//Destroy player object
		with (other) instance_destroy();
	}
}