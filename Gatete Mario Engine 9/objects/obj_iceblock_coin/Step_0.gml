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
	if (projectile) {
	
		//If the p-switch is active
		if (obj_levelcontrol.pswitch_on) {
		
			with (instance_create_depth(x, y, layer_get_depth("Main"), obj_brick)) {
			
				if (instance_exists(obj_brick))
					image_index = obj_brick.image_index;
			}
		}
		
		//Otherwise
		else {
		
			with (instance_create_depth(x, y, layer_get_depth("Main"), obj_coin)) {
			
				if (instance_exists(obj_coin))
					image_index = obj_coin.image_index;
			}			
		}
		
		//Create smoke effect
		instance_create_depth(x+8, y+8, -6, obj_smoke);
		
		//Destroy projectile
		with (projectile) event_user(0);
		
		//Destroy
		instance_destroy()
	}
}