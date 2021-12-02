/// @description Begin timer

//Increment hits
hits++;

//Begin timer
if (coiny == 0) {

	coiny = 1;
	alarm[2] = 240;
}

//Create 2 coins
for (var i=0; i<2; i++)
	instance_create_depth(x + 8 + (i * 16), ystart - 16, -4, obj_block_coin);