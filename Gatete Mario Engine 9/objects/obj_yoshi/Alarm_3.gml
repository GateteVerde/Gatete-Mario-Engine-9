/// @description Make flying noises for blue Yoshi

//Repeat
alarm[3] = 8;

//If Yoshi is flying
if (flying) {

    //Stop and Play 'Lick' sound
    audio_stop_sound(snd_yoshi_fly);
    audio_play_sound(snd_yoshi_fly, 0, false);    
}

//Otherwise, stop sound
else
	audio_stop_sound(snd_yoshi_fly);