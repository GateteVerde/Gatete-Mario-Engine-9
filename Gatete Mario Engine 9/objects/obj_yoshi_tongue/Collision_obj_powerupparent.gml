/// @description Eat powerups

if (hunger = 0) {

    //Item eaten
    hunger = 1;

    //Move tongue back
    ready = 1;
    alarm[0] = 8;

    //Food sprite
    foodsprite = other.sprite_index;

    //Food offset
    foodoffset = 0;

    //Remember powerup eaten
    powerup = other.object_index;

    //Destroy food
    with (other) instance_destroy();
}