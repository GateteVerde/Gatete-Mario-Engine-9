/// @description Stop

//Contract
alarm[2] = 90;

//Stop leftmost blocks
with (llb) { hspeed = 0; move_snap(16, 16); }
with (lrb) { hspeed = 0; move_snap(16, 16); }

//Stop rightmost blocks
with (rlb) { hspeed = 0; move_snap(16, 16); }
with (rrb) { hspeed = 0; move_snap(16, 16); }