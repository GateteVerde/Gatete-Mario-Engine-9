/// @description Map Path Parent

//Do not animate
image_speed = 0;
image_index = 0;

//In water
in_water = 0;

//Alpha
image_alpha = 0;

//If there's a modifier on this path
if (ds_map_exists(global.worldmap, id))
|| (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_modifier, 1, 0)) {

    image_alpha = 1;
    if (!ds_map_exists(global.worldmap, id))
        ds_map_add(global.worldmap, id, 1);
}