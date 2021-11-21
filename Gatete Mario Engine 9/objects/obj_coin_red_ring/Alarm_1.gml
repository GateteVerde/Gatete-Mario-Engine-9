/// @description Destroy ring and all active coins

//Destroy red coins
with (obj_coin_red) {

    //If the ring id is the same as the coins
    if (ring_id == other.ring_id)
        instance_destroy();
}

//Destroy the ring
instance_destroy();