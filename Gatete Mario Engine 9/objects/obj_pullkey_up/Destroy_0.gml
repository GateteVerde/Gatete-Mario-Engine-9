/// @description Destroy 'Phanto'

//Inherit the parent event
event_inherited();

//Destroy the pursuing phanto
if (instance_exists(obj_phanto)) {

	with (obj_phanto) {
			
		with (instance_create_depth(x, y+4, depth - 2, obj_smoke)) sprite_index = spr_smoke_b;
		instance_destroy();
		exit;
	}
}