/// @description You got a powerup from a Toad house.

//Play 'Chest Item' sound
audio_play_sound(snd_chest_item, 0, false);

//Do not animate
image_speed = 0;

//Check if ready
ready = 0;

//Alpha
alpha = 1;

//Set the vertical speed
vspeed = -3;

//Set the friction
friction = 0.05;