/// @description If Mario hangs on this rope, make it move along the rope and start up the engine

//If the player is climbing
if (obj_mario.state == playerstate.climb) {

    //If the player is not 
    if (!collision_rectangle(obj_mario.bbox_left, obj_mario.bbox_top+4, obj_mario.bbox_right+1, obj_mario.bbox_bottom-1, obj_solid, 1, 1)) 
    && (!collision_rectangle(obj_mario.bbox_left, obj_mario.bbox_top+4, obj_mario.bbox_right+1, obj_mario.bbox_bottom-1, obj_solid_moving, 1, 1)) {
    
        obj_mario.x += parent.x-parent.xprevious;
        obj_mario.y += parent.y-parent.yprevious;
    }
        
    //Make the engine move if it is not moving
    if (parent.state == "IDLE")
        parent.state = "IN_LINE";
}