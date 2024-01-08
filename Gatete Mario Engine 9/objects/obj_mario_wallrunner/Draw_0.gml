/// @description Render Mario

//Set palette
pal_swap_set_player(global.palette[global.player].main, global.palette[global.player].star);

#region FACING DIRECTION

	//Temporary variables
	var dir, face_x;
	
	//If moving in a clockwise motion
	if (direct == 1) {
		
		//Facing direction
		face_x = 1;
	
		//If moving up
		if (direction = 90)
			dir = 90;
			
		//If moving left
		else if (direction == 180)
			dir = 180;
			
		//Otherwise
		else
			dir = 270;
	}
	
	//Otherwise, if moving in a counter-clockwise motion
	else if (direct == -1) {
		
		//Facing direction
		face_x = -1;
	
		//If moving up
		if (direction = 90)
			dir = 270;
			
		//If moving left
		else if (direction == 0)
			dir = 180;
			
		//Otherwise
		else
			dir = 90;
	}
#endregion

//Draw cape
if (global.powerup == cs_cape) {

	draw_sprite_ext(spr_cape_walk, -1, screen_round(x), screen_round(y) + 16, face_x, 1, dir, c_white, obj_mario.image_alpha);
}

//Draw Mario
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y) + 16, face_x, 1, dir, c_white, obj_mario.image_alpha);

//Reset shader
pal_swap_reset();