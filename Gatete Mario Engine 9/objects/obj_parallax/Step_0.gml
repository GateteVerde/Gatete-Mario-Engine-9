/// @description Manage background animation

//Constants
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
var back_spr = layer_background_get_sprite(back_id);

//Reset animation
frame += 0.15;
if (frame >= (sprite_get_number(back_spr) - 0.15)) {
				
	frame = 0;
}