/// @description Render me

draw_sprite_ext(sprite_index, 0, screen_round(x) + 1, screen_round(y) + 1, image_xscale, 1, angle, c_white, 1);

//If this platform is not attached to a engine, draw the joint
if (parent == noone) {
	
	draw_sprite_ext(spr_platform_seesaw_joint, 0, screen_round(x) + 1, screen_round(y) + 1, 1, 1, angle, c_white, 1);
}