/// @description Dig out a mud ball

//Set kicking frame
image_speed = 1;
    
//Do not show ball
ready = 2;
    
//Generate a ball
with (instance_create_depth(x+18*sign(xscale), y, -2, obj_mudball)) {
    
    xspeed = 0.5*sign(other.xscale);
	yspeed = -3;
    y--;
}