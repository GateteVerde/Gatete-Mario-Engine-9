/// @description Create the platforms

//Create a fixed amount of platforms and chains
for (i=0; i<amount; i++) {
	
	//Platforms
	platform[i] = instance_create_depth(x, y, -1, obj_platform_ferris_platform);
	platform[i].image_xscale = image_xscale;
	platform[i].parent = id;
}

//Start moving.
active = true;