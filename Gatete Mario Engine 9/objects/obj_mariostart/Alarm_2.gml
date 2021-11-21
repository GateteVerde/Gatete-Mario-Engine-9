/// @description End the Mario Start! screen

//Create a curtain effect.
instance_create_depth(0, 0, -9, obj_curtain_out);

//Re-activate everything
instance_activate_all();

/*If a star was picked up in the inventory, become invulnerable
if (global.mapstar) {

    instance_create(0, 0, obj_invincibility);
    global.mapstar = false;
}
*/

//Destroy
instance_destroy();