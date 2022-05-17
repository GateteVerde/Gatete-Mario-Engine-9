/// @description Generate a new lakitu

//Generate a new lakitu with the same coordinates
with (instance_create_layer(0, ystart, "Main", obj_enemy_respawn)) {

    sprite_index = spr_lakitu_red;
    xmin = other.xmin;
    xmax = other.xmax;
}
