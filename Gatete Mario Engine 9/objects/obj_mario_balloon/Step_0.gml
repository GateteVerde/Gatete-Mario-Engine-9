/// @description Balloon Mario logic

//Inherit event from parent
event_inherited();

//If Mario does not exist
if (!instance_exists(obj_mario)) 
|| (instance_exists(obj_mario_transform)) {

	instance_destroy();
	exit;
}

//Otherwise
else {
	
	//Hereby same mask from Mario
	mask_index = obj_mario.mask_index;
	
	//With Mario
	with (obj_mario) {
		
		//Disable it's controls
		enable_control = false;
		
		//Make him invisible
		visible = false;	
		
		//Snap into position
		x = other.x;
		y = other.y;
		
		//Stop movement
		xspeed = 0;
		yspeed = 0;
		yadd = 0;
		
		//Do not crouch
		crouch = false;
		
		//Hereby palette
		other.isflashing = isflashing;
		
		//Reset variables
		event_user(15);
	}
	
	//No gravity
	yadd = 0;
	
	#region KEY INPUT
	
		//Up
		if ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) {
		
			yspeed -= 0.1;
			if (yspeed < -1)
				yspeed = -1;
		}
		
		//Down
		else if ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5)) {
		
			yspeed += 0.1;
			if (yspeed > 1)
				yspeed = 1;
		}
		
		//Otherwise
		else {
			
			yspeed -= 0.1;
			if (yspeed < -0.5)
				yspeed = -0.5;
		}
		
		//Left
		if ((input_check(input.left)) || (gamepad_axis_value(0, gp_axislh) < -0.5)) {
		
			xspeed -= 0.1;
			if (xspeed < -1)
				xspeed = -1;
		}
		
		//Right
		else if ((input_check(input.right)) || (gamepad_axis_value(0, gp_axislh) > 0.5)) {
		
			xspeed += 0.1;
			if (xspeed > 1)
				xspeed = 1;
		}
		
		//No input
		else {
		
			//Slowdown horizontal speed
			xspeed = max(0, abs(xspeed)-0.1)*sign(xspeed);
			
			//If almost stopped
			if ((xspeed < 0.1) && (xspeed > -0.1))             
                xspeed = 0;
		}
	#endregion
	
	//Set sprite based on powerup
	if (deflate == 0) {
		
		if (global.powerup == cs_cape)
			sprite_index = spr_mario_cape_balloon;
		else
			sprite_index = global.balloon_sprite[global.powerup];
	}
	else {
	
		sprite_index = global.spin_sprite[global.powerup];
		image_speed = 0;
		image_index = 0;
	}
}