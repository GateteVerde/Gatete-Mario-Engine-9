/// @description Timed Trampoline

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