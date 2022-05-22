/// @description Dry Bones logic

//Inherit event
event_inherited();

//Turn on ledges
turn_on_ledges = (bone == 1) ? 0 : 1;

//Set the facing direction
if (xspeed > 0)
    xscale = 1;
else if (xspeed < 0)
    xscale = -1;
