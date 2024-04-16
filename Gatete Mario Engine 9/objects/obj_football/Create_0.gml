/// @description SMB3 / SMW Holdable Item parent

//Inherit the parent event
event_inherited();

//Do not animate
image_speed = 0;
image_index = 0;

//Direction of item
dir = 1;

//Is the item held?
held = 0;

//Is the item embed in a wall
inwall = 0;

//Follower
follow = noone;

//Ignore platforms
ignore_platforms = true;

//Whether this item has been kicked
kicked = false;

//Do not slowdown when kicked (Applies only to blue bricks)
ready = 0;

