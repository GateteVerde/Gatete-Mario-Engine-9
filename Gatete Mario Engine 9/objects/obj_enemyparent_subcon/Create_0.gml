/// @description Subcon Enemy Parent

//Inherit the parent event
event_inherited();

//A collision object for the player to ride
mytop = instance_create_layer(x, y, "Main", obj_enemy_top);

//Is this enemy heavy?
//0: No
//1: Yes
//2: Yes, but unpullable
isheavy = 0;
