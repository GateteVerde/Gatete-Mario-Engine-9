/// @description Generate leaves
        
//Generate a leaf
instance_create_depth(random_range(camera_get_view_x(view_camera[0]) - 600, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 600), camera_get_view_y(view_camera[0]) - 8, -6, obj_leafeff);

//Repeat the process
alarm[0] = 8;
