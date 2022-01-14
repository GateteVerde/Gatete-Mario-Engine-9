/// @description You lost a kuribo shoe

//Play 'Powerlost' sound
audio_play_sound(snd_powerlost, 0, false);

//Do not animate
image_speed = 0;
image_index = 0;

//Movement
gravity = 0.2;
vspeed = -4;