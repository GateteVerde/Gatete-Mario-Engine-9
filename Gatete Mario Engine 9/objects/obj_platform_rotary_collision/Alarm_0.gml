/// @description Make Mario bounce

//End spin
spin = 2;
alarm[1] = 10;

//If Mario's vertical speed is lower than 0...
if (obj_mario.yspeed < 0)
    obj_mario.yspeed = obj_mario.yspeed*1.5;