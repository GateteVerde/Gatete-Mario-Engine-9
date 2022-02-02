/// @description Mario screwing gravity

//Make Mario invisible
obj_mario.visible = false;

//Conditions
desired_dir = 0;
desired_offset_x = 0;
desired_offset_y = 0;
desired_speed = 0;

//Manage collision
col = noone;
col_b = noone;

//Whether Mario can turn
can_turn = false;

//Whether Mario and stop
can_halt = false;

//Whether Mario is slowing down
slowdown = false;

//Manages flashing
isflashing = 0;

//Sets the speed and direction
alarm[0] = 4
alarm[1] = 8