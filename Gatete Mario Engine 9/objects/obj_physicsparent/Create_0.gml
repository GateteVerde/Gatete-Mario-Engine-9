/// @description Enemies, Holdable items, or Misc

//Pseudo variables
xspeed = 0;
yspeed = 0;
yadd = 0;
save_xsp = 0;
save_ysp = 0;
save_grav = 0;

//Animation speed save
save_ims = 0;

//Facing directions
xscale = 1;
yscale = 1;

//Swimming?
swimming = false;

//Bounces
bounces = -1;
bounces_max = 3;

//Depth
depth = -2;

//Whether this object is frozen
freeze = false;

//Change gravity when in contact with water
noswim = false;

//Turn towards walls?
//-1: Jump them
//0: Stop
//1: Turn around
turn_toward = 1;

//Turn towards ceilings
turn_toward_ceiling = false;
