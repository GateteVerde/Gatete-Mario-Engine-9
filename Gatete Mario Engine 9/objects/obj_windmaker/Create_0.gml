/// @description Wind Maker

//Initialize the rain system
system = part_system_create();
	
//Depth
part_system_depth(system, -10);

//Shape
part = part_type_create();
part_type_sprite(part, spr_leafeff, false, false, true);

//Alpha
part_type_alpha1(part, 1);

//Motion
part_type_speed(part, 4.5, 9, 0, 0);

//Colour
part_type_colour1(part, c_white);
	
//Life
part_type_life(part, 300, 600);

//Whether the player is inside the given area
ready = 0;