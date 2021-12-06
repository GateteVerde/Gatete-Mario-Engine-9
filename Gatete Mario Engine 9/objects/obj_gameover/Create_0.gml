/// @description Game is over for you!

//Play 'Game Over' sound
audio_play_sound(snd_gameover, 0, false);

//Do not animate
image_speed = 0;

//Restart the game
alarm[0] = 300;

//Set gravity
gravity = 0.15;

//Set Mario's position
x = global.gw / 2;

//Text position
xx = (global.gw / 2) + 50;