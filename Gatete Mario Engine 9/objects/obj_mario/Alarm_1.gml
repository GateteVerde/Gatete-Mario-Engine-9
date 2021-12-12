/// @description Generate effects

//Check for water
var water = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, obj_swim, 0, 0);

//If the player is crouched down
if (crouch == 1)
&& (state < 2)
&& (swimming == 0)
&& (abs(xspeed) > 0) 
&& (!instance_exists(obj_mario_balloon)) {
	
	alarm[1] = 4;
	with (instance_create_depth(x, bbox_bottom, depth - 1, obj_smoke)) 
		sprite_index = spr_smoke_c;		
}

//Otherwise, if the player is turning or sliding
else if ((!water) && (sprite_index == global.skid_sprite[global.powerup]) || ((sliding == 1) && (state < 2))) {

	alarm[1] = 4;
	with (instance_create_depth(x, bbox_bottom, depth - 1, obj_smoke)) {
		
		sprite_index = spr_smoke_c;
		if (global.powerup == cs_tiny) {
		
			image_xscale = 0.5;
			image_yscale = 0.5;
		}
	}
}

//Otherwise, if the player has the tiny powerup or the penguin powerup and it is on a water surface
else if ((water) && (((global.powerup == cs_tiny) && (state == 1) && (!swimming)) || ((global.powerup == cs_penguin) && (sliding == true)))) {
		
	alarm[1] = 8;
	with (instance_create_depth(x, bbox_bottom-6, depth - 1, obj_smoke)) {
			
		sprite_index = spr_splash;
		image_xscale = 0.5;
		image_yscale = 0.5;
		image_blend = make_colour_rgb(112, 200, 240);
	}
}
	
//Otherwise, if the player is sliding down a wall
else if ((wallkick == 1) && (yspeed > 0)) {
	
	//Switch between powerups
	switch (global.powerup) {
	
		//If Mario is tiny
		case (cs_tiny): {
		
			alarm[1] = 3;
			with (instance_create_depth(x+3*sign(xscale), y+8, depth - 1, obj_smoke)) {
			
				sprite_index = spr_smoke_c;
				image_xscale = 0.5;
				image_yscale = 0.5;
			}
		} break;
		
		//If Mario is small
		case (cs_small): {
			
			alarm[1] = 4;
			with (instance_create_depth(x+3*sign(xscale), y+8, depth - 1, obj_smoke))
				sprite_index = spr_smoke_c;		
		} break;
		
		//Other powerups
		default: {
			
			alarm[1] = 4;
			with (instance_create_depth(x+5*sign(xscale), y, depth - 1, obj_smoke)) 
				sprite_index = spr_smoke_c;
		} break;
	}
}
	
//Otherwise, repeat till one of the actions above is active
else
	alarm[1] = 1;