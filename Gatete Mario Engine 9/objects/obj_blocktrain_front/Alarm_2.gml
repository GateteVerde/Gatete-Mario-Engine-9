/// @description Make noises when moving

//Make noise if not outside the view and it is moving
if (speed > 0)
&& (outside_view() == false) {
	
	audio_stop_sound(snd_snake);
	audio_play_sound(snd_snake, 0, false);
	alarm[2] = 8;
}