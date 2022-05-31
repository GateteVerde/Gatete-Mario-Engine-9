/// @description Circle Boo logic

//Update timer
if (freeze == false) {
	
	time++;
	if (time) >= ((2 * pi) / ringspeed)
	    time = 0;
}

//Manage movement
x = xstart + cos((clockwise * time) * ringspeed) * ringsize;
y = ystart + sin((clockwise * time) * ringspeed) * ringsize;
