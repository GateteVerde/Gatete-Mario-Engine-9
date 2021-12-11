/// @description Glow Block logic

//Inherit the parent event
event_inherited();

//Set light radius
if (mylight != -1) {

	if (held)
		mylight.new_radius = 64;
	else
		mylight.new_radius = 16;
}