/// @description Grinder

//Current angle
angle = 0;

//State
state = "IDLE";

//Speed
spd = 1;
st_spd = spd;

//Origin
xorig = 0;
yorig = 0;

//Steps to take per steps
step = 0;

//Whether the grinder jumped from a track
ready = 0;

//Direction
direct = 270;

//Play 'Engine' sound
alarm[1] = 15;

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