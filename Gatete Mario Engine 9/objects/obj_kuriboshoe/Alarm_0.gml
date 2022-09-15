/// @description Make flying noises for jugemu's shoe

if (flying) {

    //Stop and Play 'Lick' sound
    audio_stop_sound(snd_yoshi_fly);
    audio_play_sound(snd_yoshi_fly, 0, false);
    
    //Repeat
    alarm[0] = 9;
}