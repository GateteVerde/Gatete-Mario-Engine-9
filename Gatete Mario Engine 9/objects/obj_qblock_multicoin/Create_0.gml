/// @description Multi-Coin Question Mark Block

/*
//	This object uses creation code
//
//	mushroom = Pick from below
//		0: Sprout out 5 coins
//		1: Sprout out a mushroom if you hit this block 10 or more times
//
//	scatter	= Pick from below
//		0: Normal
//		1: Burst out coins in a single go
//
//	coins = Number of coins to pop out from the block (Only works with scatter set to 1, default is 10)
*/

//Inherit event from parent
event_inherited();

//Timer
coiny = 0;

//Hits
hits = 0;

//Shard sprite
shard_sprite = spr_shard;