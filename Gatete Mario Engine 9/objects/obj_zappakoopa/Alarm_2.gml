/// @description Prepare the beam

//Create a beam with this object as parent
with (instance_create_depth(x+7*sign(xscale), y+8, -4, obj_zappakoopa_beam)) 
    parent = other.id;
