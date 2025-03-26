/// @description Carryable Enemy

//Inherit the parent event
event_inherited();

//Enemy respawn variable
turnback = -1;
if (global.turnback != -1) {

    turnback = global.turnback;
    global.turnback = -1;
}

//Timer for bombs
aa = 0;

//Bounces
bounces = 3;

//Animate faster
image_speed *= 2;