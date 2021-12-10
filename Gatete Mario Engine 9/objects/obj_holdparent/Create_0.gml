/// @description SMB3 / SMW Holdable Item parent

//Inherit the parent event
event_inherited();

//Direction of item
dir = 1;

//Is the item held?
held = 0;

//Is the item embed in a wall
inwall = 0;

//Follower
follow = noone;

//Do not slowdown when kicked (Applies only to blue bricks)
ready = 0;