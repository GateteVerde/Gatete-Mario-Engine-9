/// @description Digging minigame chest

//Do not animate
image_speed = 0;
image_index = 0;

//Whether the chest has been opened
ready = 0;

//Move it 1 pixel down
y++;

//Set the item to give
roll = round(random_range(0, 10000));

//Set up the position of the chest
x = choose(80, 160, 240, 320);