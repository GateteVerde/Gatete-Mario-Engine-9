/// @description Funky Light

//Light position
fx = irandom_range(40, global.gw - 40)
fy = irandom_range(40, global.gh - 40)
xspeed = choose(1,-1)
yspeed = choose(1,-1)

//Radius
radius = 32;

//Set motion
motion_set(random(360), random_range(1, 3));

//Update colour
image_blend = choose(c_red, c_orange, c_yellow, c_lime, c_aqua, c_blue, c_fuchsia);
alarm[0] = 60;
