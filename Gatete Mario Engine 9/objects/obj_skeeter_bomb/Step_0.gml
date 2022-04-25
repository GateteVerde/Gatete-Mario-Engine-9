/// @description Skeeter Bomb logic

//Inherit the parent event
event_inherited();

//Destroy when at ground
if (yadd == 0) {

	instance_create_layer(x, y, "Main", obj_explosion_lite);
	instance_destroy();
}
