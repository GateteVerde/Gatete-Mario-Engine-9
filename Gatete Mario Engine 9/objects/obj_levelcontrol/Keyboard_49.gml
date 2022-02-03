/// @description Normal Exit Clear (Debug)

//Clear the level
global.clear = 1;

//Forget checkpoints
global.checkpoint = noone;

//Stop all music and fanfares
event_user(0);

//Return to the map
end_level();