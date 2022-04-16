/// @description Big Bertha's Cheep-Cheep logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

//Decrement horizontal speed
xspeed = max(0.75, abs(xspeed)-0.0324)*sign(xspeed);

//Scale
scale += 0.05;
if (scale > 1)
    scale = 1;
    
//Wave.
if (y > ystart)
    yspeed -= 0.025;
else if (y < ystart)
    yspeed += 0.025;
