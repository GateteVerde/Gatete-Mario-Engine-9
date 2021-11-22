/// @description Respawn

if (xstart < camera_get_view_x(view_camera[0]) - sprite_width)
|| (xstart > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]))
|| (ystart < camera_get_view_y(view_camera[0]) - sprite_height)
|| (ystart > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])) {

    //Create the new bubble
    with (instance_create_layer(xstart, ystart, "Main", obj_enemy_bubble)) sprout = other.sprout;
    
    //Destroy
    instance_destroy();
}