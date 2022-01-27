/// @description Makes the player return to the map

//Whether the player reached this point
ready = 0;

//Do not show Mario Start!
global.mariostart = 1;

//Create controller object and prevent it to play music.
if (!instance_exists(obj_levelcontrol)) {
	
    with (instance_create_layer(0, 0, "Main", obj_levelcontrol))
		musicdisable = 1;
}