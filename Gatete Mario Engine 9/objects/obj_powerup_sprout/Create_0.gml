/// @description An item that came out from a block

//Allows exit from the block
readytogo = 0;

//Does this item bounce outta the block
bouncy = 0;

//Does this item come out from a big block
big = 0;

//Item check
alarm[0] = 2;

//Allow block exit
alarm[1] = 31;

//If there is a solid on top of the block
if (position_meeting(x, y-8, obj_solid)) {

    //Go down if both sides are blocked
    if (position_meeting(x-16, y+8, obj_solid))
    && (position_meeting(x+16, y+8, obj_solid))
        vspeed = 0.5;

    //Go right if the left side is blocked
    else if (position_meeting(x-16, y+8, obj_solid))
        hspeed = 0.5;

    //Go left if the right side is blocked
    else if (position_meeting(x+16, y+8, obj_solid))
        hspeed = -0.5;

    //Otherwise, go towards the player
    else {
    
        //If the player does exist
        if (instance_exists(obj_mario)) {
        
            if (obj_mario.x > x)
                hspeed = 0.5;
            else
                hspeed = -0.5;
        }
        
        //Otherwise, if it does not exist.
        else
            hspeed = -0.5;
    }
}

//Otherwise, move up
else
    vspeed = -0.5;