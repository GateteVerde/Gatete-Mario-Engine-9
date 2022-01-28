/// @description Handles roulette and the prizes.

//Set depth
depth = -5;

//Top
rou1 = 3;

//Middle
rou2 = 3;

//Bottom
rou3 = 3;

//Check if all three roulettes are stopped
rouend = 0;

//Plays a drum roll if you have two frames of the same kind.
drumroll = false;

//Loop 'P-Meter' sound
audio_play_sound(snd_pmeter, 0, true);