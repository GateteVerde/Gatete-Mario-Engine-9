/// @description Multi-Coin Double Wide Question Mark Block

/*
//	This object uses creation code
//
//	mushroom = Pick from below
//		0: Do not sprout a mushroom
//		1: Sprout out a mushroom if you hit this block 10 or more times
*/

//Inherit event from parent
event_inherited();

//Default variable
mushroom = false;

//Timer
coiny = 0;

//Hits
hits = 0;

//Question Mark position
xx = xstart;

//Shard sprite
shard_sprite = spr_shard;