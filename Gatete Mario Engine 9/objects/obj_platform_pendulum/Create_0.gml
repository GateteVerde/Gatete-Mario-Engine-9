/// @description Pendulum Platform

//Depth
depth = 10;

//Create the platform
platform = instance_create_depth(x, y, -1, obj_platform_pendulum_platform);
platform.image_xscale = image_xscale;
platform.parent = id;