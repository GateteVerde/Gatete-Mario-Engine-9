/// @description Shmup Mario logic

//If the player is invulnerable, manage flash
if (instance_exists(obj_invincibility)) {
		
	//If the starman is about to end
	if (obj_invincibility.alarm[0] < 120) {

		//Set up palette
		isflashing += 0.05;
		if (isflashing > 3.99)
			isflashing = 0;
	}
			
	//Otherwise
	else {
	
		//Set up palette
		isflashing += 0.25;
		if (isflashing > 3.99)
			isflashing = 0;
	}
}
else {

	if (isflashing > 0)
		isflashing = 0;
}

//Decrement shooting delay
delay--;

#region MOVEMENT

	//Vertical movement
	if ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) {

		if (!place_meeting(x, y-2, obj_solid))
			y -= 2;
	}
	
	else if ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5)) {

		if (!place_meeting(x, y+2, obj_solid))
			y += 2;
	}

	//Horizontal Movement
	if ((input_check(input.left)) || (gamepad_axis_value(0, gp_axislh) < -0.5)) {

		if (!place_meeting(x-2, y, obj_solid))
		&& (x > camera_get_view_x(view_camera[0]) + 5)
			x -= 2;
	}
	
	else if ((input_check(input.right)) || (gamepad_axis_value(0, gp_axislh) > 0.5)) {

		if (!place_meeting(x+3, y, obj_solid))
		&& ((x < camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 5))
			x += 3;
	}
	else {

		//If the "Mario Start!" object does not exist
		if (instance_number(obj_mariostart) == 0) {
		
			//If Mario is next to a solid or the screen does not scroll anymore
			if (!place_meeting(x+1, y, obj_solid))
			&& ((instance_exists(obj_autoscroll)) && (obj_autoscroll.x < room_width - global.gw/2))
				x++;
		}
	}

#endregion

#region BOUNDARY

	//Left
	if (x < camera_get_view_x(view_camera[0]) + 5)
		x = camera_get_view_x(view_camera[0]) + 5;
		
	//Right
	else if (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 5)
		x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 5;
		
	//Top
	if (y < camera_get_view_y(view_camera[0]) + 16)
		y = camera_get_view_y(view_camera[0]) + 16;
		
	//Right
	else if (y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16)
		y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16;
#endregion

//Shoot projectiles
if (delay <= 0) {

	//If the 'Control button is pressed
	if (input_check(input.action_1)) {
	
			//Play 'Fireball' sound
		audio_play_sound(snd_fireball, 0, false);
				
		//Set firing animation frame
	    delay = 16;
				
		//Create a lightning volt
	    with (instance_create_depth(x+8, y+8, -2, obj_missile))
	        xspeed = 6*sign(other.xscale);
	}
}