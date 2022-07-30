/// @description Eat red berry

if (!hunger) {

    //Item eaten
    hunger = 1;

    //Move tongue back
    ready = 1;
    alarm[0] = 8;

    //Food sprite
    foodsprite = other.sprite_index;

    //Food offset
    foodoffset = 8;
    
    //Remember berry eaten
    berry = other.sprite_index;

    //Destroy food
    with (other) instance_destroy()
}