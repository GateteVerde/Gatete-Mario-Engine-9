/// @description Mario, but inflated

//Inherit event from parent
event_inherited();

//Do not bounce
bounces = -1;

//Do not turn around
turn_toward = 0;
turn_toward_ceiling = 0;

//Play 'Balloon' sound
audio_play_sound(snd_balloon, 0, false);

//Deflate
deflate = 0;
alarm[0] = 1260;
alarm[1] = 1440;

//Flashing
isflashing = 0;