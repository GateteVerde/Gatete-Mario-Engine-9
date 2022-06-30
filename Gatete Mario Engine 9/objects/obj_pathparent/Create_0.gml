/// @description Map Path Parent

//Do not animate
image_speed = 0;
image_index = 0;

//In water
in_water = 0;

//Palette
pal = 0;

//Alpha
image_alpha = 0;

//Check map value
if (ds_map_find_value(global.worldmap, id) > 0)
|| (collision_point(x + 8, y + 8, obj_modifier, 0, 0))
	image_alpha = 1;