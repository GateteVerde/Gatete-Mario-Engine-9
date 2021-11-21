/// @description The level controller

/*
**  This item uses creation code!
**
**  inisection      = The section of the ini to load data
**  leveltime       = The time limit in seconds (Opt.)
**  camlock         = To lock the camera in position
**	classicscroll   = To implement the classic scroll on the level
*/

//Default values
inisection = "Overworld";
leveltime = 0;
camlock = 0;
classicscroll = false;

//Play music
alarm[0] = 2;
    
//The music of the level
levelmusic = noone;

//Is music disabled?
musicdisable = false;

//Set depth
depth = 10000;

//Barrier
barrier = false;
alarm[7] = 3;

//Object to follow
follow = noone;

//P-SWitch warning
pswitch_on = 0;
pswitch_warn = 0;

//Gray P-Switch warning
sswitch_on = 0;
sswitch_warn = 0;

//Reach last ground Y
floorY = 0;

//Camera orientation
orientation = 1;

//Create HUD
instance_create_layer(0, 0, "GUI", obj_hud);

//Shake variables
shake_intensity = 0;
shake_time = 0;
shake_falloff = 0;

//Used for calculating falloff
shake_starttime = 0;