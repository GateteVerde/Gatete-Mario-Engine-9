/// @description Increment alpha until the screen is faded completely

//Fade in
alpha += 0.04;

//Go to the destination room
if (alpha > 1) {

    //Set up the alpha
    alpha = 1;
    
    //Delete sprite
    sprite_delete(snapshot);
    
    //Activate all instances
    instance_activate_all();
    
    //Go to the destination room
    room_goto(target);
}