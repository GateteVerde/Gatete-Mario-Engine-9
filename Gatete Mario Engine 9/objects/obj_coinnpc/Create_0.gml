/// @description NPC Coin

//Inherit event from parent
event_inherited();

//Make it bounce
bounces = 3;

//Did this coin came from a enemy?
enemy = false;

//Blink after a bit
alarm[0] = 480;

//Destroy
alarm[1] = 600;