/// @description Lock camera depending of the variables set

//If Mario does exist
if (instance_exists(obj_mapmario))
&& (point_in_rectangle(obj_mapmario.x, obj_mapmario.y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {

    camera_x = obj_mapmario.x + 8;
    camera_y = obj_mapmario.y - 8;
    
    camera_x_min = x;
    camera_x_max = x+(sprite_get_width(sprite_index)*image_xscale);
    
    camera_y_min = y;
    camera_y_max = y+(sprite_get_height(sprite_index)*image_yscale);
    
    //Lock the camera
    with (obj_mapcontrol) {

        //If this object locks the camera in the x-axis
        if (other.camera_lock_x == true) {
			
            camera_x = screen_round(clamp(other.camera_x, other.camera_x_min + camera_get_view_width(view_camera[0])/2, other.camera_x_max - camera_get_view_width(view_camera[0])/2) - (camera_get_view_width(view_camera[0])/2));
            camera_lock_x = true;
        }
        
        //If this object locks the camera in the y-axis
        if (other.camera_lock_y == true) {
			
            camera_y = screen_round(clamp(other.camera_y, other.camera_y_min + camera_get_view_height(view_camera[0])/2, other.camera_y_max - camera_get_view_height(view_camera[0])/2) - (camera_get_view_height(view_camera[0])/2));
            camera_lock_y = true;
        }
        
        //Allow generation of clouds
        clouds = other.clouds;
    }    
}