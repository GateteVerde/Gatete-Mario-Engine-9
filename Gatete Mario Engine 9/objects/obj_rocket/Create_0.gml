/// @description Rocket

//Play 'Rocket' sound
audio_play_sound(snd_rocket, 0, false);

//Destination room
destination = room_next(room);
exit_id = -1;

//Set the vertical speed
vspeed = -0.25;

//Speed up
alarm[0] = 90;

//Shake
alarm[1] = 2;
port_x = 0;
port_y = 0;