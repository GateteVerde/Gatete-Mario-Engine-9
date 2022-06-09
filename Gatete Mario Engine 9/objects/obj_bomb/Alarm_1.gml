/// @description Blow up

with (instance_create_depth(x, y, -2, obj_explosion_lite)) hurtplayer = 0;
instance_destroy();
exit;