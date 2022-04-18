/// @description Start moving

//Go up
if (place_meeting(x,y,obj_up))
    yspeed = -0.5;

//Go down
else if (place_meeting(x,y,obj_down))
    yspeed = 0.5;

//Go left
else if (place_meeting(x,y,obj_left))
    xspeed = -0.5;

//Go right
else if (place_meeting(x,y,obj_right))
    xspeed = 0.5;
