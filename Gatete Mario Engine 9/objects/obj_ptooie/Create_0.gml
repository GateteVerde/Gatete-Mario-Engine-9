/// @description P-Tooie

//Inherit the parent event
event_inherited();

//How vulnerable is this NPC to various items?
vulnerable = 0;

//How vulnerable is this NPC to Mario?
stomp = 2;

//How edible is this NPC to Yoshi?
edible = 0;

//Turn on ledges
turn_on_ledges = true;

//Freeze object
freeze_object = -2;

//Blow the ball
alarm[0] = 2;

//Start moving
alarm[10] = 2;

//Whether the object is blowing
ready = 0;

//Distance between the ball and the ptooie
dist = bbox_top+16;

//Create the blown ball
myball = instance_create_depth(x, bbox_top-24, -2, obj_ptooie_ball);
with (myball) 
    parent = other.id;
