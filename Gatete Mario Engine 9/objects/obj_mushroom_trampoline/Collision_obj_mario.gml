/// @description Make Mario bounce

if (other.yspeed > 0)
&& (other.bbox_bottom < yprevious+5) {
	
	//Play 'Trampoline' sound
	audio_play_sound(snd_trampoline, 0, false);

	//Start wiggling
	ready = 1;

    //Make Mario bounce
    with (other) event_user(1);
}