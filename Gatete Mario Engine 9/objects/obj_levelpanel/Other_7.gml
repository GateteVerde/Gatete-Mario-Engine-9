/// @description Finish level beat animation

if (sprite_index == spr_levelpanel_beaten) 
|| (sprite_index == spr_levelpanel_red_beaten) {

	//Stop animation
	image_speed = 0;
    image_index = 3;
}