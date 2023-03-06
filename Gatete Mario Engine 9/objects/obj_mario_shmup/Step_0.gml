/// @description Mario's Logic

//Stay always in front
depth = -5;

#region MOVEMENT

	#region INPUT
	
		var key_u = (input_check(input.up) || (gamepad_axis_value(0, gp_axislv) < -0.5))
		var key_d = (input_check(input.down) || (gamepad_axis_value(0, gp_axislv) > 0.5))
		var key_l = (input_check(input.left) || (gamepad_axis_value(0, gp_axislh) < -0.5))
		var key_r = (input_check(input.right) || (gamepad_axis_value(0, gp_axislh) > 0.5))
	#endregion
	
	//Push
	xadd = 1

	//Movement
	xspeed = xadd + (key_r - key_l) * 1.5;
	yspeed = (key_d - key_u) * 1.5;
	
#endregion

//Collision
move_and_collide(xspeed, yspeed, obj_solid);

//If moving down
if (yspeed > 0) {
	
	move_and_collide(0, yspeed, obj_semisolid);
	move_and_collide(0, yspeed, obj_slopeparent);
}