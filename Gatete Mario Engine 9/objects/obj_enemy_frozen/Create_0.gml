/// @description Frozen Enemy

//Inherit event from parent
event_inherited();

//Do not animate
image_speed = 0;

//Object to retrieve
ret = -1;
ret_spr = -1;

//Whether the object is being held
held = 0;

//Whether the object has been kicked
ready = 0;

//Number of kills
hitcombo = 0;

//Offset
offset = 0;
alarm[0] = 480;

//Destroy after 10 seconds
alarm[1] = 600;

//Leave a trail
alarm[2] = 1;