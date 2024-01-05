/// @description Stop

//Expand
alarm[0] = 90;

//Stop all blocks
with (block1) { speed = 0; move_snap(16, 16); }
with (block2) { speed = 0; move_snap(16, 16); }
with (block3) { speed = 0; move_snap(16, 16); }
with (block4) { speed = 0; move_snap(16, 16); }