/// @description Create the enemy depending of the sprite.

switch (sprite_index) {

    //Cheep Cheep
    case (spr_cheepcheep): {
    
        instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 64, y, -2, obj_cheepcheep);
    } break;
	
	//Boss Bass
	case (spr_bossbass): {
	
		instance_create_depth(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 64, y, -2, obj_bossbass);
	} break;
}

//Destroy
instance_destroy();
