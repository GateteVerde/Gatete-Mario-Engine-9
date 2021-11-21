/// @description Stop moving raft parts

//Stop horizontal speed
hspeed = 0;

//Snap them
if (myr != noone) {

    myr.x = x+16;
    with (myr) event_user(2);
}