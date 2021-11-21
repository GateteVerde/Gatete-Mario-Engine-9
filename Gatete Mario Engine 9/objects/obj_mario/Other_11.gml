/// @description Jump boost after stomping

//Set the vertical speed
yspeed = -4.125;

//Boost jump
y--;

//Variable jumping
if (input_check(input.action_0))
	jumping = 1;
else
	jumping = 2;