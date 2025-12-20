/// @description Static E-Switch

//Animate
image_speed = 1;

//Make it solid
mysolid = instance_create_depth(x, y, depth, obj_solid);

//Check if there's a ceiling above
ceiling = (position_meeting(x, y-1, obj_solid)) ? -1 : 1;