/// @description Warp Note Block

/*
//	This object uses creation code
//
//	myroom = Use macro list
*/

//Default value
myroom = room_next(room);

//Inherit event from parent
event_inherited();

//If there's a note block in the room, retrieve frame from them
if (instance_exists(obj_noteblock))
	image_index = obj_noteblock.image_index;
else
	image_index = 0;