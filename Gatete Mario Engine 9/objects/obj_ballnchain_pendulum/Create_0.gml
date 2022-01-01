/// @description Pendulum Ball 'n' Chain

//Depth
depth = 10;

//Create the platform
platform = instance_create_depth(x, y, -1, obj_ballnchain_ball_pendulum);
platform.image_xscale = image_xscale;
platform.parent = id;