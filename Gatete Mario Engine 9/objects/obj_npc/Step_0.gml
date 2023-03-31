/// @description NPC logic

//Inherit the parent event
event_inherited();

#region INTERACT

	//Check for Mario
	var mario = collision_rectangle(bbox_left-16, bbox_top-16, bbox_right+16, bbox_bottom, obj_mario, 0, 0);

	if (ready == 1)
	&& (mario)
	&& (mario.state < playerstate.jump)
	&& ((input_check_pressed(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5))  {

		//Play 'Message' sound
	    audio_play_sound(snd_message, 0, false);
    
	    //Create the message
		with (instance_create_layer(0, 0, "GUI", obj_message_dialog)) {

			varmsg = other.varmsg;
			mugshot = other.mugshot;
			mute_sound = other.mute_sound;
		}
    
	    //Make it unreadable to prevent spam
	    ready = 0;
    
	    //Delay readability of the signpost after a while
	    alarm[0] = 24; 
	}
#endregion

//Set the facing direction
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xscale = -1;
else
	xscale = 1;