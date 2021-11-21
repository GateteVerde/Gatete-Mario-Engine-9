/// @description Turn into 4 coins

instance_create_layer(x, y, "Main", obj_coin);
instance_create_layer(x + 16, y, "Main", obj_coin);
instance_create_layer(x, y + 16, "Main", obj_coin);
instance_create_layer(x + 16, y + 16, "Main", obj_coin);
instance_destroy();
exit;