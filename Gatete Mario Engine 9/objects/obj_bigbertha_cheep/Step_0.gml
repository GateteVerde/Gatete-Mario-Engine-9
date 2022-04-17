/// @description Big Bertha's Cheep-Cheep logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

//Decrement horizontal speed
xspeed = max(0.75, abs(xspeed)-0.0324)*sign(xspeed);
    
//Wave
yspeed += (y > ystart) ? -0.025 : 0.025;

//Facing direction
if (xspeed > 0)
	xscale = 1;
else if (xspeed < 0)
	xscale = -1;
