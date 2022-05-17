/// @description Lakitu egg logic

//Inherit the parent event
event_inherited();

//Turn into a spiny if this is a red egg
if (yadd == 0)
&& (sprite_index == spr_spiny_egg) {

	instance_create_depth(x, y, -2, obj_spiny);
	instance_destroy();
	exit;
}
