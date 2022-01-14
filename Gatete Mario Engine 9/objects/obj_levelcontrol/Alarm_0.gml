/// @description Loop the music

//If the music is not disabled or the p-switch is active
if (!audio_is_playing(global.stream))
&& (pswitch_on == 0)
&& (gswitch_on == 0)
&& (musicdisable == false)
	event_user(3);