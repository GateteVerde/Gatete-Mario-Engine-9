/// @description Protect the player from the horrors of holding "nothing"

if (held) {

    //If the player was holding something
    if (instance_exists(obj_mario))
    && (obj_mario.holding == 2)
        obj_mario.holding = 0; 
}