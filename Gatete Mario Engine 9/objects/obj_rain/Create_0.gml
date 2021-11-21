/// @description Rain drop

//Animate
image_speed = 0;
image_index = choose(0, 1, 2, 3);

//Alpha
image_alpha = random_range(0.5, 1);

//Speed
spd = round(random_range(3, 6));

//Set the motion
hspeed = -spd;
vspeed = spd;