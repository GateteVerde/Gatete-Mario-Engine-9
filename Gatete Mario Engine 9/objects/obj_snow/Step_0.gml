/// @description Snow flake logic

//Destroy when colliding with any object
if (ready == 0) {

    //Destroy when colliding with any collision object
    if (place_meeting(x, bbox_bottom-1, obj_semisolid))
    || (place_meeting(x, bbox_bottom-1, obj_slopeparent))
    || (place_meeting(x, bbox_bottom-1, obj_swim)) {
    
        //Force path end
        path_end();
        
        //Start fading out
        ready = 1;
    }
}

//Otherwise
else {

    image_alpha -= 0.05;
    if (image_alpha < 0.05)
        instance_destroy();
}

//Destroy when outside
if (y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))
	instance_destroy();