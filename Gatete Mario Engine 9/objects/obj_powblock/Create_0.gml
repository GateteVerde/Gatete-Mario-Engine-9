/// @description Carryable POW Block

//Inherit the parent event
event_inherited();

//Whether this POW block has been kicked
kicked = 0;

//Make it semisolid on top
mysolid = instance_create_layer(0, 0, "Main", obj_semisolid);