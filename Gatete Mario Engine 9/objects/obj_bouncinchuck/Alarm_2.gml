/// @description Jump towards the player

//Play 'Trampoline' sound
audio_play_sound(snd_trampoline, 0, false);

//Set vertical speed
yspeed = -6;

//Boost jump
y--;

//Reset offset
offset = 0;

//Set jump state
jumping = 2;

//Set jumping frame
image_index = 2;

//If the player does not exist or it's at the left
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    xspeed = -2.1;
else
    xspeed = 2.1;