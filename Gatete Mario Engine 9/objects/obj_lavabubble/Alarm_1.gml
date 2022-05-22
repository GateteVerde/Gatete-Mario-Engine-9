/// @description Make it jump

//If inside view
if (x > camera_get_view_x(view_camera[0]) - 32)
&& (x < camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 32) {

    //Make it visible
    visible = true;
    
    //Set the vertical speed.
    yspeed = -4;
    
    //Play sound and create lava effect.
    alarm[2] = 10;
}

//Otherwise, wait
else
    alarm[1] = 10;
