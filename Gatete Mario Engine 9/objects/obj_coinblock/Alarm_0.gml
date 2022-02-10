/// @description Begin movement sequence

//Play 'P-Balloon' sound
audio_play_sound(snd_pballoon, 0, false);

//Make it visible
visible = false;

//Move to the appropiate position
ready2 = 1;

//Freeze all objects under obj_physicsparent
with (obj_physicsparent) event_user(13);

//Freeze Mario
with (obj_mario) {

	if (freeze == false)
		event_user(13);
}

//Delay visibility
alarm[1] = 2;