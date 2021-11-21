/// @description Beanstalk

//Play 'Beanstalk' sound
audio_play_sound(snd_beanstalk, 0, false);

//Vine type
//0: SMB3 / SMW
//1: SMB1
vinetype = 0;

//Create a vine
alarm[0] = 16;

//Move upwards
vspeed = -1;

//Depth
depth = 10;

//Destination room
myroom = room_next(room);