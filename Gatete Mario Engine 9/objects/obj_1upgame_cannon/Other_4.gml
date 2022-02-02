/// @description Create HUD and fade out

instance_create_layer(0, 0, "GUI", obj_hud);
instance_create_depth(0, 0, -99, obj_fade_out);