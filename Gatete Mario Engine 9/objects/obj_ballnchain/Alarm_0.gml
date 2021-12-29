/// @description Create the balls

//Increment ball distance
distance += 8;

//Create a fixed amount of balls and chains
for (i=0; i<amount; i++) {
	
	//Platforms
	ball[i] = instance_create_depth(x, y, -1, obj_ballnchain_ball);
	ball[i].image_xscale = image_xscale;
	ball[i].parent = id;
}

//Start moving.
active = true;