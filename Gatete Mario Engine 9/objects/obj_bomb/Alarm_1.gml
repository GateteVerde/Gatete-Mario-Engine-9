/// @description Blow up

with (instance_create_layer(x, y, "Main", obj_explosion_lite)) hurtplayer = 0;
instance_destroy();
exit;