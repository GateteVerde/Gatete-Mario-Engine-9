/// @description Urchin

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 3;

//How vulnerable is this enemy to Mario?
stomp = 2;

//How vulnerable is this enemy to Yoshi?
edible = 2;

//Pseudo speed variables
save_sp = 0;
save_dir = 0;

//Blink
alarm[0] = 60;

//Start moving
alarm[10] = 2;

//This prevents a bug that causes it to not work if it starts on a certain wall.
if (place_meeting(x, y+1, obj_solid))
    y++;
if (place_meeting(x-1, y, obj_solid) == false)
    direction = 180;
