/// @description Parallax Background Controller

//Turn background layer invisible
layer_set_visible("Background", 0);

//Set depth
depth = layer_get_depth("Background") - 1;

//Set scrolling layers (default: zero)
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
var back_spr = layer_background_get_sprite(back_id);
for (var i = 0; i < sprite_get_number(back_spr); i++)
	scroll[i] = 0;

//Scrolling timelapse
time = 0;