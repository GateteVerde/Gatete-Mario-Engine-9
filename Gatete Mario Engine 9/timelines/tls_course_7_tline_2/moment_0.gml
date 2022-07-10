/// @description Create coin script

function create_coin() {

	instance_create_depth(argument[0], argument[1], 0, obj_coin);
	instance_create_depth(argument[0] + 8, argument[1] + 8, -6, obj_smoke);
}