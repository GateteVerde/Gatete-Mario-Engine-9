/// @description Collect the coin

//If not moving up
if (yspeed < 0)
exit;

instance_create_depth(x, y, -4, obj_block_coin);
instance_destroy();