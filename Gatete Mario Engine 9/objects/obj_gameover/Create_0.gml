/// @description Game is over for you!

//Play 'Game Over' sound
audio_play_sound(snd_gameover, 0, false);

//Text position
xx = (global.gw / 2) + 50;

//Move Mario and apply gravity
x = (global.gw / 2);
y = -32;

//Set gravity
gravity = 0.15;

//Do not animate
image_speed = 0;

//Restart the game
alarm[0] = 300;