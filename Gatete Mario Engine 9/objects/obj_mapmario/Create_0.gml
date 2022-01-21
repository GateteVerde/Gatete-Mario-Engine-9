/// @description It's a me, Mario! (Map)

//Set depth
depth = -5;

//Check if the position was modified before
if (ds_map_exists(global.worldmap, "playerx")) {

    //Place the player where it belongs
    x = ds_map_find_value(global.worldmap, "playerx");
    y = ds_map_find_value(global.worldmap, "playery");
}
else {

    //Set up the current position
    ds_map_add(global.worldmap, "playerx", x);
    ds_map_add(global.worldmap, "playery", y);
}

//Whether the object is moving
status = mapstate.idle;

//Speed
spd = 1;

//Origin
xorig = 7;
yorig = 7;

//Steps to take per steps
step = 0;

//Direction
direct = 270;

//Whether the player is climbing
is_climbing = 0;

//Whether the player has selected a stage
is_ready = 0;

//Scale
xscale = 1;

//Reset global variables
reset_globals(global.died);
global.died = 0;

//To save the game
savegame = false;

//If the level has been beaten
if (global.clear > 0) {

    alarm[0] = 32;
    status = mapstate.wait;   
}