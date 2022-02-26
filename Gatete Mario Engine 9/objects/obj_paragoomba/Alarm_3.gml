/// @description End flight

//End flight
flying = 3;

//Set the horizontal speed
if (xspeed > 0)
    xspeed = 0.5;
else if (xspeed < 0)
    xspeed = -0.5;