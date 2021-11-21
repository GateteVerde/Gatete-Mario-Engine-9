/// @description Lightning Sheet

//Play 'Lightning' sound
audio_play_sound(snd_lightning, 0, false);

//Animate
image_speed = 0.15;

//Set the frame
if (choose(0,1) == 1)
    image_index = 0;
else
    image_index = 2;