/// @description Manage cannon

//If the cannon can be moved
if (state == 0) {
	
	//End movement phase
	if (input_check_pressed(input.action_0))
		state = 1;

	//If the 'Right' key is pressed or the joystick is at the right
	if ((input_check(input.right)) || (gamepad_axis_value(0, gp_axislh) > 0.5)) {

		//Set the animation
		image_speed = 1;

		//Move to the right
		x += 2;
		if (x > room_width-64)
			x = room_width-64;
	}
	
	//Otherwise, if the 'Left' key is pressed or the joystick is at the left
	else if ((input_check(input.left)) || (gamepad_axis_value(0, gp_axislh) < -0.5)) {
	
		//Set the animation
		image_speed = -1;
	
		//Move to the left
		x -= 2;
		if (x < 64)
			x = 64;
	}
	
	//Otherwise
	else
		image_speed = 0;
}

//If the position has been set, set up angle
else if (state == 1) {
	
	//Do not animate
	image_speed = 0;
	
	//Shoot the cannon ball
	if (input_check_pressed(input.action_0)) {
	
		//Play 'Thud' sound
		audio_play_sound(snd_thud, 0, false);
		
		//Create effect
		repeat (16) {

			with (instance_create_depth(x, y, 150, obj_smoke))
				motion_set(random_range(other.angle + 15, other.angle - 15), random(6));
		}
		
		//State
		state = 2;

		//Launch cannon ball
		with (instance_create_depth(x, y, 100, obj_1upgame_cannon_ball))
			motion_set(other.angle, 6);
	}

	//If the 'Right' key is pressed or the joystick is at the right
	if ((input_check(input.right)) || (gamepad_axis_value(0, gp_axislh) > 0.5)) {

		//Set angle
		angle -= 5;
		
		//Prevent the cannon to be tilted too much
		if (angle < 45)
			angle = 45;
	}
	
	//Otherwise, if the 'Left' key is pressed or the joystick is at the left
	else if ((input_check(input.left)) || (gamepad_axis_value(0, gp_axislh) < -0.5)) {
	
		//Set the animation
		angle += 5
	
		//Move to the left
		if (angle > 135)
			angle = 135;
	}	
}

//Round position variables
x = self.x;
y = self.y;

//Clamp the X/Y position to the room so that shakes on the bottom of the screen still occur fine
var camera_x = screen_round(clamp(x, camera_get_view_width(view_camera[0])/2, room_width - camera_get_view_width(view_camera[0])/2) - (camera_get_view_width(view_camera[0])/2));

//Initial clamp in view
var camera_y = screen_round(clamp(y, camera_get_view_height(view_camera[0])/2, room_height - camera_get_view_height(view_camera[0])/2) - (camera_get_view_height(view_camera[0])/2));

//Ensure there is no view target so that the camera can be manually moved
camera_set_view_target(view_camera[0], noone);

//Set the camera position
camera_set_view_pos(view_camera[0], camera_x, camera_y);

//Get ID from "Background 0"
var lay_id = layer_get_id("Background_0");
			
//Get data from said layer
var back_id = layer_background_get_id(lay_id);
var back_spr = layer_background_get_sprite(back_id);

//Horizontal parallax
layer_x("Background_0", camera_x / 2);
			
//Vertical parallax
if (sprite_get_height(back_spr) < room_height)
&& (sprite_get_height(back_spr) > camera_get_view_height(view_camera[0]))
	layer_y("Background_0", camera_y * (room_height - sprite_get_height(back_spr)) / (room_height -  camera_get_view_height(view_camera[0])));	