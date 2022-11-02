/// @description Blargg

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 99;

//How vulnerable is this enemy to Mario?
//0:	Normal
//1:	Hurt Mario
//2:	Hurt Mario + Immune to Mounts
//3:	Subcon
//4:	Stomp (Custom)
//-1:	Phase through Mario
stomp = 1;

//How edible is this enemy to Yoshi?
//0:	Edible
//1:	Edible, but create a item
//2:	Non-Edible
edible = 2;

//Does this enemy turn into a silver coin?
//0:	No
//1:	Yes
turn_silver = 0;

//Ignore platforms
ignore_platforms = true;

//Do not animate
image_speed = 0;
image_index = 0;

//Depth
depth = 100;

//Move 16 pixels down
y += 16;

//Move up
alarm[0] = 60;
