/// @function draw_sprite_custom_origin(sprite,subimg,x,y,axis_x,axis_y,xscale,yscale,rot,col,alpha);
/// @param sprite
/// @param subimg
/// @param x
/// @param y
/// @param rot_x
/// @param rot_y
/// @param xscale
/// @param yscale
/// @param rot
/// @param col
/// @param alpha
function draw_sprite_custom_origin() {
	
	//If not necessary to build the matrix, draw normally
	if (argument[8] == 0 && argument[6] == 1 && argument[7] == 1)
	
		draw_sprite_ext(argument[0], argument[1], argument[2], argument[3], argument[6], argument[7], argument[8], argument[9], argument[10]);
	
	//Otherwise, draw from the given axis
	else {
	
		//Build & set the matrix
		matrix_set(matrix_world, matrix_build(argument[2]-sprite_get_xoffset(sprite_index)+argument[4], argument[3]-sprite_get_yoffset(sprite_index)+argument[5], 0, 0, 0, argument[8]*argument[6], argument[6], argument[7], 1));
			
		//Draw sprite
		draw_sprite_ext(argument[0], argument[1], sprite_get_xoffset(sprite_index)-argument[4], sprite_get_yoffset(sprite_index)-argument[5], 1, 1, 0, argument[9], argument[10]);

		//Set back to normal
		matrix_set(matrix_world, matrix_build_identity());
	}
}