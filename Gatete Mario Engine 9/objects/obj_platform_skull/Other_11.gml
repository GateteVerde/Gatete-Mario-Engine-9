/// @description Stop moving raft parts

//Stop horizontal speed
hspeed = 0;

//Snap them
if (myl != noone) {

    myl.x = x-16;
    with (myl) event_user(1);
}