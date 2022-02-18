/// @description Begin key sequence

//Play 'Keyhole' sound
audio_play_sound(snd_key, 0, false);

//Start the animation
ready = 1;

//Stop music and time
with (obj_levelcontrol) {

    event_user(0);
    alarm[2] = 0;
}

//Open up the secret exit
global.clear = 2;