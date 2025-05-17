/// @description Break with the following items

//Inherit event from parent
event_inherited();

//Set up the items that can break this block
items = [

	obj_fireball,
	obj_fireball_gold
]

for (var i=0; i < array_length(items); i++) {
	
	var projectile = collision_rectangle(bbox_left-5, bbox_top-5, bbox_right+4, bbox_bottom+4, items[i], 0, 0);
	if (projectile)
	&& (projectile != obj_iceball) {
	
		//Create a muncher		
		with (instance_create_depth(x, y, layer_get_depth("Main"), obj_cruncher)) {
			
			if (instance_exists(obj_muncher))
				image_index = obj_muncher.image_index;
		}
				
		//Create smoke effect
		instance_create_depth(x+8, y+8, -6, obj_smoke);
		
		//Destroy projectile
		with (projectile) event_user(0);
		
		//Destroy
		instance_destroy()
	}
}