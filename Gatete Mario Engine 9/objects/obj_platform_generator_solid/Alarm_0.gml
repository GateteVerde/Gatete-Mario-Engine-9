/// @description Generate the platform if the generator is inside the view.

//If the generator is inside the view
if (x > camera_get_view_x(view_camera[0]) - sprite_width)
&& (x < camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) {

    //Generate a platform
    with (instance_create_layer(x, y, "Main", obj_platform_solid)) {
    
        image_xscale = other.image_xscale;
        speed = other.spd;
        ready = 1;
        if (other.y > room_height/2)
            direction = 90;
        else
            direction = 270;
    }
    
    //Repeat the process
    alarm[0] = round(60 * time);
}

//Otherwise, deny
else
    alarm[0] = 1;