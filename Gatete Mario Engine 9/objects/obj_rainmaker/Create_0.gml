/// @description Rain generator

//Initialize the rain system
system = part_system_create();
	
//Depth
part_system_depth(system, -10);

//Shape
part = part_type_create();
part_type_sprite(part, spr_rain, false, false, true);

//Alpha
part_type_alpha1(part, 1);

//Motion
part_type_speed(part, 7, 14, 0, 0);
part_type_direction(part, 225, 225, 0, 0);

//Colour
part_type_colour1(part, c_white);
	
//Life
part_type_life(part, room_speed, room_speed * 2);

//Smog pos
pos = 0;

//Alpha
alpha = 1;

//Create lightning
alarm[0] = 100;

//Delay 'Rain' sound
alarm[1] = 1;