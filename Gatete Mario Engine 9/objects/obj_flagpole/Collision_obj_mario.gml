/// @description Turn the player into the player goal object

if (other.y >= y+16) {

    //Create goal player
    with (instance_create_depth(x+8, other.y, -5, obj_mario_flagpole)) {
    
        //Set up the id of this flagpole
        flagpole = other.id;
        
        //Make the flag move down
        with (other.flag) event_user(0);
    }
    
    //Destroy player object
    with (other) instance_destroy();
}