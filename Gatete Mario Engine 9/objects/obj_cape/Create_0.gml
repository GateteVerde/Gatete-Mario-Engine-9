/// @description Mario's Cape

// Do not animate
image_speed = 0;
image_index = 0;

// Cape state
enum capestate {

    cape_idle,
    cape_walk,
    cape_jump_up,
    cape_jump_down,
    cape_spin_up,
    cape_spin_down,
    cape_climb
}
state = capestate.cape_idle;

//Flashing variable
isflashing = 0;

// Owner of the cape
owner = noone;