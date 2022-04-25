/// @description Hurt Mario and blow up

//Hurt Mario
with (other) event_user(0);

//Blow up
instance_create_layer(x, y, "Main", obj_explosion_lite);
instance_destroy();
