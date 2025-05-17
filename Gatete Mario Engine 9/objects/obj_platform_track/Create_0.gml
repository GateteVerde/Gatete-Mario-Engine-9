/// @description Track Platform

//Inherit event from parent
event_inherited();

//State
state = "FALLING";

//Speed
st_spd = spd;

//Origin
xorig = sprite_width/2-1;
yorig = sprite_height/2-1;

//Steps to take per steps
step = 0;

//Whether the platform jumped from a track
ready = 0;

//Direction
direct = 270;

//Set up direction based on modifier
if (place_meeting(x, y, obj_up)) {

    direct = 90;
    state = "IN_LINE";
}
else if (place_meeting(x, y, obj_down)) {

    direct = 270;
    state = "IN_LINE";
}
else if (place_meeting(x, y, obj_left)) {

    direct = 180;
    state = "IN_LINE";
}
else if (place_meeting(x, y, obj_right)) {

    direct = 0;
    state = "IN_LINE";
}