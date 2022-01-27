/// @description Set motion

if (x < (room_width/2))
    hspeed = 0.25+random_range(-0.2, 0.2);
else
    hspeed = -0.25+random_range(-0.2, 0.2);
    
if (y < (room_height/2))
    vspeed = 0.25+random_range(-0.2, 0.2);
else
    vspeed = -0.25+random_range(-0.2, 0.2);