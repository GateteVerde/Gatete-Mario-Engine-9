/// @description Used POW Block

//Trigger shockwave
with (obj_coordinator) {

    var_mouse_pos_x = other.x - camera_get_view_x(view_camera[0]);
    var_mouse_pos_y = other.y - camera_get_view_y(view_camera[0]) + 8;
    event_user(0);
}

//Do not animate
image_speed = 0;
image_index = 0;

//Depth
depth = -2;

//Scale
scale = 1;

//Whether this object has done his job.
ready = 0;