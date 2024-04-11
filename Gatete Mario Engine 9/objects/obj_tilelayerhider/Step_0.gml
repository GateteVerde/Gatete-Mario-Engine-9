/// @description Set circle position
	
//Check for Mario
var mario = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, [obj_mario, obj_mario_warp, obj_mario_jump, obj_mario_climb, obj_mario_rocket], 1, 0);
	
//If Mario is inside this area
if (mario) {
		
	//Set radius
	radius = lerp(radius, 48, 0.2);
		
	//Manipulate position
	xx = mario.x + 4;
	yy = mario.y;
}
	
//Otherwise
else {
		
	//Decrement radius
	radius = lerp(radius, 0, 0.2);
}