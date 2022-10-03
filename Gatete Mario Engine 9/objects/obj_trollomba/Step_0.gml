/// @description Trolloomba logic

//Inherit the parent event
event_inherited();

//Check for Mario
var mario = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mario, 0, 0);
if (mario) {
	
	//Create explosion
	instance_create_layer(x, y, "Main", obj_explosion_lite);

	//Insta-Kill Mario
	with (mario) {
	
		//Create death object
		imdead = instance_create_depth(x, y, -5, obj_mario_dead);
		
		//With imdead
		with (imdead) {
		
			//If health mode is activated
			if (global.hp_mode == 1)
				sprite_index = spr_mario_dead_big;
				
			//Otherwise
			else {
			
				if (global.powerup == cs_tiny)
					sprite_index = spr_mario_dead_tiny;
				else
					sprite_index = spr_mario_dead_big;
			}
		}
		
		//Destroy
		instance_destroy();
	}
	
	//Destroy
	instance_destroy();
}

//Set the facing direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;