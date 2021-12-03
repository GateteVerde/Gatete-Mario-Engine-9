/// @description Balance Platform logic

//Inherit event from parent
event_inherited();

//Check for the player
var mario = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0);

//If the player exists
if (mario)
&& (mario.state != playerstate.jump)
&& (mario.bbox_bottom < yprevious+5) {
	
    //If the platform is still being held with the rope.
    if (ready = 0) {
            
        //Set the vertical speed.
        vspeed += 0.1
        
        //Set the vertical speed for the other platform.
        with (parent) vspeed -= 0.1
    }
}

//Slowdown both platforms
event_user(0);

//Make both platforms fall and give points.
event_user(1);

//Create new platforms when falling and outside the view.
if (ready == 1) {

    gravity = 0.15;    
    if (y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 32) 
	&& (parent.y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 32) {
    
        ready = 2; 
        alarm[2] = 1;
    }
}
else
    gravity = 0;