/// @description Set circle position

if (instance_exists(obj_mario)) {
	
	//If Mario is inside this area
	if (point_in_rectangle(obj_mario.x, obj_mario.y, bbox_left, bbox_top, bbox_right + 8, bbox_bottom + 8)) {
		
		//Set radius
		radius = lerp(radius, 48, 0.2);
		
		//Manipulate position
		xx = obj_mario.x;
		yy = obj_mario.y;
	}
	
	//Otherwise
	else {
		
		//Decrement radius
		radius = lerp(radius, 0, 0.2);
	}
}
else
	active = false;
