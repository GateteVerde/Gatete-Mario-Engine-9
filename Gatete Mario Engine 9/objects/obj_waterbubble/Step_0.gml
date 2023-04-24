/// @description Bubble logic

//If not frozen
if (freeze == false) {

	//Handle scale
	xscale += 0.01 * sign(ready);
	yscale -= 0.01 * sign(ready);

	//Change scale direction
	if (xscale > 1.1)
		ready = -1;
	else if (xscale < 0.9)
		ready = 1;

	//Move it
	if (collision_rectangle(x, y, x+15, y+15, obj_up,0,0))
	    vspeed -= 0.0324;
	if (collision_rectangle(x, y, x+15, y+15, obj_down,0,0))
	    vspeed += 0.0324;
	if (collision_rectangle(x, y, x+15, y+15, obj_left,0,0))
	    hspeed -= 0.0324;
	if (collision_rectangle(x, y, x+15, y+15, obj_right,0,0))
	    hspeed += 0.0324;
}
else {

	if (abs(speed) > 0)
		speed = 0;
}