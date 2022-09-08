/// @description It's a me, Mario! (Climb)

//Animate
image_speed = 0.15;

//Whether the vine reached a solid
ready = 0;

//Play a sound when 7 is hit
climb = 0;

//Whether the player is flashing
isflashing = 0;

//Whether the player is holding an item
holding = 0;

//Handle the held item sprite and frame
myitem = -1;
myframe = 0;

//Move to the bottom of the screen
y = room_height+16;

//Create a climbable vine
myvine = -1;
alarm[0] = 32;
