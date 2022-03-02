/// @description Trolloomba

//Inherit event
event_inherited();

//How vulnerable is this enemy to various items?
//0:	Normal
//1:	Immune to fireballs
//2:	Immune to all projectiles
//99:	Immune
//100:	Immune + Ignore projectiles
vulnerable = 99;

//How vulnerable is this enemy to Mario?
//0:	Normal
//1:	Hurt Mario
//2:	Hurt Mario + Immune to Mounts
//3:	Subcon
//4:	Stomp (Custom)
//-1:	Phase through Mario
stomp = -1;

//How edible is this enemy to Yoshi?
//0:	Edible
//1:	Edible, but create a item
//2:	Non-Edible
edible = 2;

//Does this enemy turn on ledges?
//0:	No
//1:	Yes
turn_on_ledges = 1;

//Does this enemy turn into a silver coin?
//0:	No
//1:	Yes
turn_silver = 0;

//Move towards Mario
alarm[10] = 2;