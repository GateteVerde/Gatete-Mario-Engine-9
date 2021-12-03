/// @description Create the right platform

parent = instance_create_layer(platx, platy, "Main", obj_platform_piston_right);
parent.parent = id;
parent.image_xscale = image_xscale;