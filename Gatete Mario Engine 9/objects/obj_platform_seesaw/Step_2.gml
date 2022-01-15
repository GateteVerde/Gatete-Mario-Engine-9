/// @description Make the seesaw tilt

//Update slope increment variable
add = (dsin(image_angle) * 0.21) * - 1;

//Update extra
extra = 20+(abs(image_angle) / 20);

//Radius
radius = (sprite_width / 2 + sprite_height / 2) - 8;

#region LOGIC

	//Count how many items are above the seesaw
	if (collision_circle(x, y, radius, obj_mario, 1, 0))
	&& (obj_mario.state != playerstate.jump)
	&& (obj_mario.bbox_bottom < bbox_bottom+4) {
				
		//Calculate distance
		var myincrement = sprite_get_width(sprite_index) / 4;
		var mydist = point_distance(x, y, obj_mario.x, obj_mario.y);

		//Set angle
		angle_speed += -((1/1000) * (((obj_mario.x > x) * 2) - 1) * ((mydist / 16) * myincrement));
	}
	
	//Otherwise, decrement angle speed
	else {
		
		angle_speed = max(0, abs(angle_speed)-0.0162)*sign(angle_speed);
		if ((angle_speed > -0.0162) && (angle_speed < 0.0162))
			angle_speed = 0;
	}
	
#endregion

//Set angle
image_angle += angle_speed;
angle = image_angle;
	
//Cap angle
if (abs(image_angle) > 45) {
	
	image_angle = 45 * sign(image_angle);
	if (angle_speed != 0)
		angle_speed = -angle_speed/2;
}

//Cap angle speed
if (abs(angle_speed) > 2)
    angle_speed = 2 * sign(angle_speed);