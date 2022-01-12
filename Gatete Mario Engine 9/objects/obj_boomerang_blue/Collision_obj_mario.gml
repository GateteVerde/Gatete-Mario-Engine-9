/// @description Make Mario interact with the item

//If the item is not held
if (!held) {
        
    //If the player can hold the item
    if (can_hold()) 
    && (!inwall)
    && (other.bbox_bottom > bbox_top) {
    
        //Create a held blue boomerang
        instance_create_layer(x, y, "Main", obj_boomerang_blue_held);
        
        //Make sure the player holds it
        other.holding = 3;
        
        //Destroy
        instance_destroy();
    }
}