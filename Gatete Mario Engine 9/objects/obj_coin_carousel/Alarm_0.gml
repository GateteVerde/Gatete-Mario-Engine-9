/// @description Create the coins

//Create a fixed amount of platforms and chains
for (i=0; i<amount; i++) {
	
	//Coins
	coin[i] = instance_create_layer(x, y+8, "Main", obj_coin);
}

//Start moving.
active = true;