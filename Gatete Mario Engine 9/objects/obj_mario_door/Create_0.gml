/// @description It's a me, Mario (Door)

//Default variables
destination = room_next(room);
exit_id = -1;
my_door = noone;

//Whether the player is holding an item
holding = 0;

//Handle the held item sprite and frame
myitem = -1;
myframe = 0;

//Handle the palette of the player when invincible
isflashing = 0;