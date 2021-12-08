/// @description Freeze Mario

//Unfreeze
freeze = false;

//Remember animation
save_ims = image_speed;
image_speed = 0;

//Remember horizontal speed
save_xsp = xspeed;
xspeed = 0;

//Remember vertical speed
save_ysp = yspeed;
yspeed = 0;

//Remember gravity
save_grav = yadd;
yadd = 0;