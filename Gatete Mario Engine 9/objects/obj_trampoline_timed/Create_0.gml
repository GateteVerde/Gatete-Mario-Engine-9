/// @description Timed Trampoline

/*
**  This item uses creation code!
**
**  time = Time (In seconds) that the trampoline will last upon picking it up.
*/

//Default values
time = 8;

//Inherit the parent event
event_inherited();

//Set the sprite
sprite_index = spr_trampoline;

//Do not animate
image_speed = 0;
image_index = 0;

//Whether the player is using the trampoline
ready = 0;
ready2 = 0;

//Whether the timer has been activated
ready3 = 0;