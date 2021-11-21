/// @description Rain logic

//Check for a semisolid
var semisolid = collision_rectangle(bbox_left-hspeed, bbox_bottom, bbox_left, bbox_bottom+vspeed, obj_semisolid, 0, 0);

//Check for a slope
var slope = collision_rectangle(bbox_left-hspeed, bbox_bottom, bbox_left, bbox_bottom+vspeed, obj_slopeparent, 1, 0);

//Check for a water object
var water = collision_rectangle(bbox_left-hspeed, bbox_bottom, bbox_left, bbox_bottom+vspeed, obj_swim, 0, 0);

//Destroy when colliding with any collision object
if (vspeed > 0) {

    //If there's a semisolid
    if (semisolid)
    || (slope)
    || (water) {
    
        //If the collision is a semisolid
        if (semisolid) {
        
            y = semisolid.bbox_top-5;
        }
    
        //Halt
        hspeed = 0;
        vspeed = 0;
    
        //Create a drop object
        with (instance_create_depth(x, y+5, -6, obj_smoke)) {
        
            sprite_index = spr_rain_sp;
            image_speed = 0.3;
        }
        
        //Destroy
        instance_destroy();
    }
}

//Destroy when outside
if (y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))
	instance_destroy();