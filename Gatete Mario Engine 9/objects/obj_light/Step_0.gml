/// @description Follow up the player

//Round position
x = round(x);
y = round(y);

//Set the Mario object to follow
follow_which_mario();

//If Mario does exists, follow him and set up the same scale
if (instance_exists(follow)) {
	
	//Do not change while there's a transformation object
	if (!instance_exists(obj_mario_transform)) {
		
		//Set radius
		radius = (global.powerup == cs_mega) ? lerp(radius, 96, 0.0325) : lerp(radius, 32 + (64 * instance_number(obj_invincibility)), 0.0325);
	
		//Set light position
		x = follow.x;
		if (global.powerup == cs_mega)
			y = follow.y - 32;
		else
			y = follow.y;
	}
}
else if (instance_exists(obj_mario_card)) {

	//Set radius
	radius = (global.powerup == cs_mega) ? lerp(radius, 96, 0.0325) : lerp(radius, 32 + (64 * instance_number(obj_invincibility)), 0.0325);
	
	//Set light position
	x = obj_mario_card.x;
	if (global.powerup == cs_mega)
		y = obj_mario_card.y - 32;
	else
		y = obj_mario_card.y;		
}
