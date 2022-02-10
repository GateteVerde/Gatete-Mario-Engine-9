/// @description Delay visibility and set trajectory

//Jump
var grav = 0.09375;
vspeed = -4;
gravity = grav;

//Calculate horizontal trajectory
var traj = round((camera_get_view_x(view_camera[0]) + 42) - x)
hspeed = (traj / ((-1 * 2 * vspeed) / grav))

//Now appear on the sequence
visible = true;