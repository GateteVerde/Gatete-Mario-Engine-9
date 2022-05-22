/// @description Flame Chomp

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 0;

//How vulnerable is this enemy to the player?
stomp = 0;

//Momentum
oldxspeed = 0;
oldyspeed = 0;

//How vulnerable is this enemy to yoshi?
edible = 0;

//Animate
image_speed = 0;

//Stop and shoot
alarm[0] = 150;

//Stop him
ready = 0;

//Fireball variables
anim = 0.2;
followers = 5;
closeness = 8;
amount_previous = 2480;

//Set fireballs start position
for (i=0; i<amount_previous; i++;) {

    oldx[i] = x;
    oldy[i] = y;
}
