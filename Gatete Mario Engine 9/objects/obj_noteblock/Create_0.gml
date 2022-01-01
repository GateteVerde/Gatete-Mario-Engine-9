/// @description Note Block

//Inherit event from parent
event_inherited();

//If there's a note block in the room, retrieve frame from them
if (instance_exists(obj_noteblock))
	image_index = obj_noteblock.image_index;
else
	image_index = 0;