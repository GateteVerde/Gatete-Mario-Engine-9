/// @description Pick up block

//Destroy if Mario approaches the block while in Mega form
if (collision_rectangle(bbox_left-4, bbox_top-4, bbox_right+4, bbox_bottom+6, obj_mario, 0, 0))
&& (global.powerup == cs_mega)
&& (instance_exists(obj_megashroom_timer))
	event_user(15)

//Check for the player
if (can_hold())
&& (input_check_pressed(input.action_1))
&& (collision_rectangle(bbox_left-2, bbox_top-1, bbox_right+2, bbox_bottom, obj_mario, 0, 0)) {

	//Create a throwable brick
	with (instance_create_layer(obj_mario.x, obj_mario.y, "Main", obj_brick_blue_th)) {
		
		//Set the sprite
		sprite_index = other.held_sprite;
		shard_sprite = other.shard_sprite;
		
	
		//Force Mario to grab it
		obj_mario.holding = 2;
		
		//Hold it
		held = true;
		
		//Stop movement
		xspeed = 0;
		yspeed = 0;
		yadd = 0;
	}
	
	//Destroy
	instance_destroy();
}