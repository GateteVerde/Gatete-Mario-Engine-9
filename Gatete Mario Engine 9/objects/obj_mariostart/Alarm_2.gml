/// @description End the Mario Start! screen

//Create a curtain effect
instance_create_depth(0, 0, -9, obj_curtain_out);

//Re-activate everything
instance_activate_all();

//Destroy
instance_destroy();