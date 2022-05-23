/// @description Set offset

//Set offset
offset += 1 * sign(offsetdir);

//Repeat
alarm[4] = 2;

//Reverse offset
if (offset == 1)
	offsetdir = -1;
else if (offset == -1)
	offsetdir = 1;
