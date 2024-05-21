/// @description Wiggler

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 2;

//How vulnerable is this enemy to Mario?
stomp = 4;

//How vulnerable is this enemy to Yoshi?
edible = 2;

//Turn on ledges?
turn_on_ledges = 1;

//Turn into silver coins?
turn_silver = 0;

//Not angry
state = 0

//Colour
color = 0;

//Variable to ensure segments stay connected to the head on all times
bodyadd = 0;

//Start moving
alarm[10] = 2;

#region CREATE BODY PARTS

	//Body parts count
	seg = 5;

	//Create anatomy
	for (var b = 1; b < seg; b++) {

	    mybody[b] = instance_create_depth(xstart, ystart, depth, obj_wiggler_body)
		mybody[b].image_speed = 1;
	    mybody[b].image_index = b;
	    mybody[b].depth = b;
	    mybody[b].parent = id;
	    if (b = 1)
	        mybody[b].prevsegment = other.id; //Snap to the head.
	    else
			mybody[b].prevsegment = mybody[b-1] //Snap to other consecutive parts.
	}

	//Make body structure
	closeness = 16;
	amount_previous = 85;

	//Make body coordinate queue
	for (i=1; i<=amount_previous; i++;) {

	    oldx[i] = x;
	    oldy[i] = y;
	}
#endregion
