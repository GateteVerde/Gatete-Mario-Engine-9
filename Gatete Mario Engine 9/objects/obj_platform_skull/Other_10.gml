/// @description Start moving raft parts

//Set the horizontal speed
hspeed = place_meeting(x, y, obj_left) ? -0.5 : 0.5;

//Start moving all raft parts
ready = 1;
if (myl != noone)
    with (myl) event_user(0);