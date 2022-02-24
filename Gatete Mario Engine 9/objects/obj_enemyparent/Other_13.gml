/// @description Ledge turn script

//If the enemy can't turn on ledges, exit this event.
if (turn_on_ledges == false)
exit;

//If there's no gravity
if (yadd == 0) {

    //If moving left
    if (xspeed < 0) {
    
        //If there's no ground on the way, turn around
        if (!collision_rectangle(bbox_left+3, bbox_bottom-1, bbox_left+3, bbox_bottom+12, obj_semisolid, 0, 0))
        && (!collision_rectangle(bbox_left+3, bbox_bottom-1, bbox_left+3, bbox_bottom+12, obj_slopeparent, 0, 0)) {
        
            xspeed = -xspeed;
            x = xprevious;
        }
    }
    
    //Otherwise, if moving right
    else if (xspeed > 0) {
    
        //If there's no ground on the way, turn around
        if (!collision_rectangle(bbox_right-3, bbox_bottom-1, bbox_right-3, bbox_bottom+12, obj_semisolid, 0, 0))
        && (!collision_rectangle(bbox_right-3, bbox_bottom-1, bbox_right-3, bbox_bottom+12, obj_slopeparent, 0, 0)) {
        
            xspeed = -xspeed;
            x = xprevious;          
        }
    }
}