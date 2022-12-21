/// @description Break with vegetables

//Inherit the parent event
event_inherited();

//Set up the items that can break this block
items = [

	obj_beetroot,
	obj_carryparent
]

for (var i=0; i < array_length(items); i++) {
	
	//Check for the vegetable
	var veg = collision_rectangle(bbox_left-5, bbox_top-6, bbox_right+4, bbox_bottom+5, items[i], 0, 0);
	
	//If there's a vegetable
	if (veg) 
	&& (veg.yadd > 0) {
	
		//Destroy block
		event_user(15);
		
		//Make vegs bounce
		if (veg.object_index == obj_beetroot) {
			
			with (veg) {
				
				yspeed = -3;
				xspeed = -xspeed;
			}
		}	
	}
}