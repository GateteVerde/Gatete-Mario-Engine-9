/// @description Mario when it's running on walls or ceilings

//Destroy spinner object
with (obj_spinner) instance_destroy();

//Make Mario invisible
with (obj_mario) {

    visible = false;
    enable_control = false;
}

//Sprite
sprite_index = global.run_sprite[global.powerup];

//Angle
angle = 0;

//Speed
speed = 2.7;

//Direction
direction = 90;

//Whether the player can turn
ready = false;

//Set angle
alarm[0] = 4;

//Allow turn
alarm[1] = 16;

//Default direction
//-1: Counter clockwise
//1: Clockwise
xscale = 1;

//Flashing
isflashing = 0;