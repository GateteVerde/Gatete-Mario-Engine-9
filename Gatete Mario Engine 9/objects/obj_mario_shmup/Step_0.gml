/// @description Shmup Mario logic

//Vertical movement
if ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) {

	if (!place_meeting(x, y-2, obj_solid))
	&& (y > 16)
		y -= 2;
}
	
else if ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5)) {

	if (!place_meeting(x, y+2, obj_solid))
	&& (y < room_height-16)
		y += 2;
}

//Horizontal Movement
if ((input_check(input.left)) || (gamepad_axis_value(0, gp_axislh) < -0.5)) {

	if (!place_meeting(x-2, y, obj_solid))
		x -= 2;
}
	
else if ((input_check(input.right)) || (gamepad_axis_value(0, gp_axislh) > 0.5)) {

	if (!place_meeting(x+3, y, obj_solid))
		x += 3;
}
else {

	if (!place_meeting(x+2, y, obj_solid))
	&& (!instance_exists(obj_mariostart))
		x++;
}