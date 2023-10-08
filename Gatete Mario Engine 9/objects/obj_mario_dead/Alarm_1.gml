/// @description Restart the room

if (audio_is_playing(snd_dead))
|| (audio_is_playing(snd_timeup)) {

	alarm[1] = 1;
	exit;
}
end_level();