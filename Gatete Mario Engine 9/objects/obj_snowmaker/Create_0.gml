/// @description Snow generator

//Initialize the snow system
system = part_system_create();
	
//Depth
part_system_depth(system, -10);

//Shape
part = part_type_create();
part_type_sprite(part, spr_snow, false, false, true);

//Alpha
part_type_alpha2(part, 0.5, 1);

//Motion
part_type_speed(part, 3, 6, 0, 0);
part_type_direction(part, 240, 260, 0.05, 0.1);

//Colour
part_type_colour1(part, c_white);
	
//Life
part_type_life(part, 300, 600);