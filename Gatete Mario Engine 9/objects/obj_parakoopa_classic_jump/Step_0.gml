/// @description Jumping Classic Parakoopa logic

//Inherit the parent event
event_inherited();

//If not jumping
if (yadd == 0) {
    
    //Boost jump
	yspeed = (swimming) ? -2 : -4;
    y--;
}