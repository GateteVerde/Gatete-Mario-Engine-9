/// @description Make flying noises for blue Yoshi

if (flying) {

    //Stop and Play 'Lick' sound
    audio_stop_sound(snd_yoshi_lick);
    audio_play_sound(snd_yoshi_lick, 0, false);
    
    //Repeat
    alarm[3] = 8;
}
