/// @description Open the chest

//If the player didn't opened a chest yet
if (input_check_pressed(input.action_1))
&& (!obj_toad.ready)
&& (collision_rectangle(x, y, x+31, y+31, obj_mario, 0, 0)) {

    //Make toad kick out the player outta his house
    with (obj_toad) {
    
        ready = 1;
        alarm[2] = 360;
    }
    
    //Change frame
    image_index = 1;
    
    //Get powerup
    with (instance_create_depth(x+16, y, depth-1, obj_powerup_get))
        sprite_index = macro_get_sprite(global.prize[other.type]);
}