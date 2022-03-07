/// @description Jumping Classic Parakoopa logic

//Inherit the parent event
event_inherited();

//If not jumping
if (yadd == 0) {
    
    //Boost jump
	yspeed = (swimming) ? -3 : -6;
    y--;
}