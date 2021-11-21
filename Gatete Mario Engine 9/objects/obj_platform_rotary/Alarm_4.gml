/// @description Create spin collision

spincollision = instance_create_layer(x + 16, y - 24, "Main", obj_platform_rotary_collision)
spincollision.alarm[2] = 50