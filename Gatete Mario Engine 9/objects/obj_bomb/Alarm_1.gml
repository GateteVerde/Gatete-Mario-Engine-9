/// @description Blow up

with (instance_create_layer(x, y, "Main", obj_explosion)) hurtplayer = 0;
instance_destroy();
exit;