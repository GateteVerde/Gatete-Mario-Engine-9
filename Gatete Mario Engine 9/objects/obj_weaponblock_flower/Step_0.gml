/// @description Break with the following items

//Inherit event from parent
event_inherited();

//Set up the items that can break this block
items = [

	obj_fireball,
	obj_iceball,
	obj_superball,
	obj_fireball_gold
]

for (var i=0; i < array_length(items); i++) {
	
	var projectile = collision_rectangle(bbox_left-4, bbox_top-4, bbox_right+3, bbox_bottom+3, items[i], 1, 0)
	if (projectile) {
	
		event_user(15);
		with (projectile)
			instance_destroy();
	}
}