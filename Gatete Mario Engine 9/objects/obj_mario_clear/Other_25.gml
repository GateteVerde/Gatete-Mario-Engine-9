/// @description Begin countdown state

//Start the countdown if there is a time limit
if (global.timer > 0)
    alarm[1] = 1;
else
    alarm[2] = 1;