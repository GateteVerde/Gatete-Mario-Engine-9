/// @description Snow flake

//Animate
image_speed = 0;
image_index = choose(0,1,2);

//Alpha
image_alpha = random_range(0.5, 1);

//Speed
spd = random_range(0.5, 3);

//Check
ready = 0;

//Set the motion
path_start(pth_snow, spd, path_action_continue, false);