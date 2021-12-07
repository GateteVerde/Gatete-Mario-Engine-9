/// @description Foreground water

//Set depth
depth = -7;

//Create a water surface
water = instance_create_layer(x, y+4, "Main", obj_swim);
with (water) {

    image_xscale = room_width / 16;
    image_yscale = room_height / 16;
}