/// @description Generate a cloud

//Generate another cloud
alarm[11] = round(random(120)) + 120;

//Generate current cloud
if (choose(0,1) == 1)
    instance_create_depth(camera_get_view_x(view_camera[0])-16, camera_get_view_y(view_camera[0])-16, -6, obj_mapcloud);
else
    instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), -6, obj_mapcloud);