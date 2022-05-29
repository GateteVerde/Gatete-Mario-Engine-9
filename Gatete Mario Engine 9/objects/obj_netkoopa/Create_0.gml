/// @description Net Koopa

//Inherit the parent event
event_inherited();

//How vulnerable is this NPC to various items?
vulnerable = 0;

//How vulnerable is this NPC to Mario?
stomp = 0;

//How vulnerable is this NPC to Yoshi?
edible = 0;

//Set depth
depth = -2;

//Allow to turn around
turnaround = 0;

//Set starting direction
if (place_snapped(32, 32))
    ready = 0;
else if (place_snapped(32, 16))
    ready = 1;
else if (place_snapped(16, 32))
    ready = 2;
else
    ready = 3;
