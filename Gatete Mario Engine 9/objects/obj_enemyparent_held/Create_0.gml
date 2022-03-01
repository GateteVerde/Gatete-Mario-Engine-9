/// @description The parent event for all holdable NPC

//Inherit the parent event
event_perform_object(obj_holdparent, ev_create, 0);

//Make the item able to bounce
bounces = 3;

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

//Does this enemy turn into a silver coin?
//0:	No
//1:	Yes
turn_silver = 1;

//NPC Health
hp = 0;
firehp = 0;

//Freeze sprite (Used mainly for enemies that require extra parts to be drawn)
freeze_sprite = -1;