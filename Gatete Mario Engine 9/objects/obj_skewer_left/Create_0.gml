/// @description Leftward Skewer

//Create the trunk
with (instance_create_depth(x-48, y, 10, obj_skewer_trunk_left))
    parent = other.id;