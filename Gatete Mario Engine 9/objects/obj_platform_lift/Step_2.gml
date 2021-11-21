/// @description Elevator lift logic

//Inherit the parent event
event_inherited();

//Check for the player
var mario = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0);

//If the player exists and this one is above this platform
if (mario)
&& (mario.state != playerstate.jump)
&& (mario.bbox_bottom < yprevious+5) {

	//If not moving
	if (ready == 0) {
	
		//Play 'Switch' sound
		audio_play_sound(snd_switch, 0, false);
		
		//Start up
		ready = 1;
		
		//Set vertical speed
		vspeed = .5;
		
		//Mario's on the platform
		ison = true;
		
		//If the platform can move sideways
		if (sideways != 0)
			hspeed = .5 * sign(sideways);
	}
	
	//Otherwise, if the platform is moving
	else {
	
		//If Mario is not on the platform
		if (ison == false) {
			
			//Play 'Switch' sound
			audio_play_sound(snd_switch, 0, false);
		
			//Mario's on the platform
			ison = true;
			
			//Change ready state
			ready = -ready;
			
			//Change vertical speed
			vspeed = 0.5 * sign(ready);
		}
	}
}
else
ison = false;

//If the platform is outside the view
if (outside_view()) {

    if (xstart < camera_get_view_x(view_camera[0])-sprite_width)
    || (ystart < camera_get_view_y(view_camera[0])-sprite_height)
    || (xstart > camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]))
    || (ystart > camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])) {
		
		//Reset states;
		ready = 0;
		ison = 0;
		
		//Go to start position
		x = xstart;
		y = ystart;
		
		//Stop movement
		speed = 0;
    }        
}