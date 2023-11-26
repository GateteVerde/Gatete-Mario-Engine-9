/// @description It's a me, Mario! (Pipe)

//Default variables
destination = room_next(room);
exit_dir = 0;
exit_id = -1;
pipetype = 0;

//Cannon mode
cannon = 0;

//Whether the player can exit the pipe
ready = 0;
ready2 = 0;

//Whether the player can move
canmove = 1;

//Whether the player is holding an item
holding = 0;

//Handle the held item sprite and frame
myitem = -1;
myframe = 0;

//Cape animation
cape_anim = 0;

//Handle the palette of the player when invincible
isflashing = 0;