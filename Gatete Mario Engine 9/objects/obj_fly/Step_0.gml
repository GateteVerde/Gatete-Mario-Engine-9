/// @description Flying cape logic

// If gravity is enabled
if (enable_gravity == 1) {
	
	// Update position based on xspeed and yspeed values
	x += xspeed;
	y += yspeed;
	xspeed += xadd;
	yspeed += yadd;	
}

// Cap vertical speed differently depending on what's going on
if (!nose_diving) {
	
	yspeed_cap = 4;
	yadd = 0.125;
	
} else {
	
	yspeed_cap = 6;
	yadd = 0.25;
}

// Collision
event_user(0);

#region FLYING LOGIC

// Reduce speed if grounded
if (yadd == 0) {

	// Slow player down
	xspeed = max(0,abs(xspeed)-0.25)*sign(xspeed);
	
	// Ruin the flight (remove the below line of code to remove flight ruining)
	flight_ruined = true;	
}

// Sprite count
var crashed = false;
var sprite_count = sprite_get_number(sprite_index) - 1;

// Once the flight has been "ruined" by hitting something, all you can do is plummet
if (flight_ruined) {
	
	// You're too slow
	owner.run = false;
	
	// You're not flying anymore
	owner.flying = false;
	
	// Decrement P-meter
	owner.pmeter--;
	
	// Stop the P-meter sound
	audio_stop_sound(snd_pmeter);
	
	// If nose-diving, get out of it and go back to the 
	if (image_index > 2) {
		
		// Full dive grants a smash
		if (image_index >= sprite_count) {
			
			crashed = true;
			
		} else
		
			image_index = 2;
		
	} else {

		// Quickly dive down a short amount to make the transition more natural
		image_index += 0.5;
		
		// Snap back
		if (image_index > 2)
		
			image_index = 2;
		
	}
	
// If you're allowed to fly AND you're not currently buddied up against a wall, then perform flight logic
} else if (can_fly) {
	
	// Do you get to fly?
	var take_flight = false;
	
	// Input press forward, start nose diving
	if (((input_check(input.right) || (gamepad_axis_value(0, gp_axislh) > 0.5)) && (xscale == 1))
	|| ((input_check(input.left) || (gamepad_axis_value(0, gp_axislh) < -0.5)) && (xscale == -1))) {
		
		// Change image index while nose diving
		image_index += 0.1875;
		
		// Grant speed increase from soaring
		if (xspeed < 3.4 && xscale > 0) {
			
			xspeed += 0.1;
			
		} else if (xspeed > -3.4 && xscale < 0) {

			xspeed -= 0.1;

		}
		
		// If at a full nose dive, then remember that
		if (image_index >= sprite_count) {
			
			image_index = sprite_count;
			nose_diving = true;
			
		}
		
	// Input press going backwards
	} else if (((input_check(input.right) || (gamepad_axis_value(0, gp_axislh) > 0.5)) && (xscale == -1))
	|| ((input_check(input.left) || (gamepad_axis_value(0, gp_axislh) < -0.5)) && (xscale == 1))) {
		
		// If you're not nose diving, start bringing the face back up
		if (!nose_diving) {
			
			image_index -= 0.1875;
			
			if (image_index <= 0) {
			
				image_index = 0;
				take_flight = true;
				
			}
			
		} else if (image_index > sprite_count-1) {
			
			take_flight = true;	
			
		}
		
	} else {
		
		// Return back to base position if at dive pose
		if (image_index > 2) {
			
			image_index -= 0.1875;
			
			if (image_index < 2)
			
				image_index = 2;
			
		// Return back to base position if body was outward
		} else if (image_index < 2) {
			
			image_index += 0.1875;
			
			if (image_index > 2)
			
				image_index = 2;
			
		}
		
	}
	
	if (take_flight && !at_wall) {
		
		// Play the sound
		audio_play_sound(snd_rise, 0, 0);
		
		// Calculate time of flight
		var cape_timer = 9+(image_index*4);
		
		// Set up cape timer finalization
		var callback = function() {
			
			flying = false;
			
		}
		
		// Create function 
		timer(callback, cape_timer);
		
		// Start flying
		flying = true;
		
		// Don't allow another flight until the timer is finished
		can_fly = false;
		
		// Forget previous nose-dive if one occurred
		nose_diving = false;
		
	}
	
}

if (flying) {
	
	// Cap image index
	if (image_index > 0) {
			
		image_index -= 0.375;
			
		if (image_index <= 0) {
			
			image_index = 0;
		
		}
			
	}

	// Soar upwards
	yspeed -= 1.6725;
	
	// Perform no gravity check
	yadd = 0;
	
	// Cap vertical speed UPWARDS
	if (yspeed <= -4)
		yspeed = -4;
	
} else if (!can_fly) {
	
	// If going downwards
	if (yspeed >= 0) {
		
		// Start going back to neutral position
		if (image_index < 2) {
			
			image_index += 0.1875;
			
		}
		
		// Once at neutral position, grant permission to fly again
		if (image_index >= 2) {
			
			image_index = 2;
			
			if (xscale > 0 && !input_check(input.left)
			|| xscale < 0 && !input_check(input.right))
				can_fly = true;
				
		}
	
	}
	
}

// Set up horizontal speed to 0 when xspeed hits the value given on 'dec'.
if ((xspeed < 0.0375 && xspeed > -0.0375))             
    xspeed = 0;

// Cap to the set vertical speed
if (yspeed >= yspeed_cap) {
	
	yspeed = yspeed_cap;
	
}

// Stop flying
var water = collision_rectangle(bbox_left, y-1, bbox_right, y, obj_swim, 1, 0);
if ((xspeed == 0 && flight_ruined) || water || crashed || !input_check(input.action_1)) {
	
	// Destroy cape
	instance_destroy();
	
	// Play the p-meter sound again
	if ((owner.pmeter >= global.pmeter_limit) && (global.pmeter_sound) && (!water))
		audio_play_sound(snd_pmeter, 0, true);
	
	// Give the player back some movement privileges
	owner.fly = noone;
	owner.enable_gravity = true;
	owner.flying = false;
	owner.jumping = 0;
	
	// Crash sound / effect
	if (crashed) {
		
		// Implement crash effects / enemy deaths
		audio_play_sound(snd_thud, 0, 0);
		
		// Shake the camera
		shake_camera(6, ceil(audio_sound_length(snd_thud) * room_speed), true);
		
	}
	
}

#endregion

// Manage owner
if (instance_exists(owner) && owner != noone) {
	
	// Let cape owner keep same speed
	owner.xspeed = xspeed;
	owner.yspeed = yspeed;
	owner.yadd = yadd;
	
	// Attach owner
	owner.x = x;
	owner.y = y;
	
	isflashing = owner.isflashing;	
}