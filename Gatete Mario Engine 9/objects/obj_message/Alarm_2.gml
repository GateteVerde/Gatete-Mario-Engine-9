/// @description Makes sounds play as the message is being displayed

//If the message is being displayed
if (showing == 1) 
&& (mute_sound == false) {

    //If all of the characters have not been displayed yet
    if (a <= string_length(text)) {

        //Stop and Play 'Kick 3' sound
        audio_stop_sound(snd_kick_3)
        audio_play_sound(snd_kick_3, 0, false)

        //Play the sound again later
        alarm[2] = 7;
    }
}