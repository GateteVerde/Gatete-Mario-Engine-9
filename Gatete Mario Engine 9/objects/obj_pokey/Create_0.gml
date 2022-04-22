/// @description Pokey

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 3;

//How vulnerable is this enemy to Mario?
stomp = 2;

//How vulnerable is this enemy to Yoshi?
edible = 0;

//Top
a = 1;
alarm[1] = 2;

//Offset values
offset = 0;
offsetnext = 0;
offsetxscale = 1;

//Remember enemies below.
if (position_meeting(x, bbox_bottom+8, obj_pokey)) {

    mebelow = collision_point(x, bbox_bottom+8, obj_pokey, 0, 0);
    alarm[0] = 10;
}
 
//If there's not enemies below, note that and start walking towards mario.
else {

    mebelow = noone;
    alarm[10] = 2;
}
