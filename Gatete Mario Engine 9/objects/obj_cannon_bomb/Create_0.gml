/// @description Cannon Bob-Omb cannon

//Start shooting
alarm[0] = 90;

//Create solid mask
instance_create_layer(x, y, "Main", obj_solid);
