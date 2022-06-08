/// @description Shoot a cannonball

//If Mario does not exist
if (!instance_exists(obj_mario))
|| ((instance_exists(obj_mario)) && (instance_exists(obj_mario_transform)))
|| (obj_levelcontrol.gswitch_on == true) {

    alarm[0] = 1;
    exit;
}

//Play 'Cannon' sound
audio_play_sound(snd_thud, 0, false);
    
//Create cannons
switch (angle) {
    
    //0, 90, 180, 270
    default: {
		
		with (instance_create_depth(x+16, y, -2, obj_bulletbill)) {
		
			sprite_index = spr_cannonball;
			xspeed = 1.5;
		}		
		with (instance_create_depth(x, y-16, -2, obj_bulletbill)) {
		
			sprite_index = spr_cannonball;
			yspeed = -1.5;
		}		
		with (instance_create_depth(x-16, y, -2, obj_bulletbill)) {
		
			sprite_index = spr_cannonball;
			xspeed = -1.5;
		}		
		with (instance_create_depth(x, y+16, -2, obj_bulletbill)) {
		
			sprite_index = spr_cannonball;
			yspeed = 1.5;
		}
    } break;

    //45, 135, 225, 315
    case (45):
    case (135): 
    case (225): 
    case (315): {
		
		with (instance_create_depth(x+16, y-16, -2, obj_bulletbill)) {
		
			sprite_index = spr_cannonball;
			xspeed = 1.5;
			yspeed = -1.5;
		}		
		with (instance_create_depth(x-16, y-16, -2, obj_bulletbill)) {
		
			sprite_index = spr_cannonball;
			xspeed = -1.5;
			yspeed = -1.5;
		}		
		with (instance_create_depth(x-16, y+16, -2, obj_bulletbill)) {
		
			sprite_index = spr_cannonball;
			xspeed = -1.5;
			yspeed = 1.5;
		}		
		with (instance_create_depth(x+16, y+16, -2, obj_bulletbill)) {
		
			sprite_index = spr_cannonball;
			xspeed = 1.5;
			yspeed = 1.5;
		}
    } break;
}
    
//Turn 45 degrees
alarm[1] = 60;
