/// @description Render me

//Draw the chain
for (i=1; i<(parent.distance/16); i++) {
	
    draw_sprite_ext(spr_ballnchain_chain, 0, xstart+lengthdir_x(i*16, point_direction(xstart, ystart, x, y)), ystart+lengthdir_y(i*16, point_direction(xstart, ystart, x, y)), 1, 1, 0, c_white, 1);
}

//Draw the platform
draw_self();