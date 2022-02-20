/// @description The parent object for all enemy NPCs

//Inherit the parent event (Please refer to the flags on this event when creating a enemy too)
event_inherited();

//How vulnerable is this enemy to various items?
//0:	Normal
//1:	Immune to fireballs
//2:	Immune to all projectiles
//99:	Immune
//100:	Immune + Ignore projectiles
vulnerable = 0;

//How vulnerable is this enemy to Mario?
//0:	Normal
//1:	Hurt Mario
//2:	Hurt Mario + Immune to Mounts
//3:	Subcon
//4:	Stomp (Custom)
//-1:	Phase through Mario
stomp = 0;

//How edible is this enemy to Yoshi?
//0:	Edible
//1:	Edible, but create a item
//2:	Non-Edible
edible = 0;

//Does this enemy turn on ledges?
//0:	No
//1:	Yes
turn_on_ledges = 0;

//Does this enemy turn into a silver coin?
//0:	No
//1:	Yes
turn_silver = 1;