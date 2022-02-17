/// @description Begin countdown state

//Start the countdown if there is a time limit
if (global.timer > 0)
    alarm[0] = 1;
else
    alarm[1] = 1;