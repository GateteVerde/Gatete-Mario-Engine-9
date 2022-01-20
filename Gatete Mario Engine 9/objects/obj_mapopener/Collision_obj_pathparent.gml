/// @description Make the path visible

with (other) {

    //Add it to the map
    ds_map_replace(global.worldmap, id, 1)
    
    //If it is not visible, make it visible
    if (image_alpha == 0)
        image_alpha = 1;
}