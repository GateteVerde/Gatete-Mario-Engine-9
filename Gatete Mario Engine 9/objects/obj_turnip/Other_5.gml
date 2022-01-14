/// @description Remember the item held for the next room.

if (held) {

    //Remember the object.
    global.carrieditem = object_index;
    
    //Remember the sprite of the object.
    global.carriedsprite = sprite_index;
	global.carriedframe = image_index;
}