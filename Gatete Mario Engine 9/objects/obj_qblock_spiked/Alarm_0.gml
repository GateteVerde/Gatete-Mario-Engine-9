/// @description Turn and move Mario

//If Mario exists
if (instance_exists(obj_mario)) {

    //If Mario is on this block
    if ((collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 1, 0))
    && (obj_mario.bbox_bottom < yprevious+5)
    && (obj_mario.state < playerstate.jump)) {
    
        //Move Mario
        with (obj_mario) {
        
            yspeed = -4;
            xspeed = 1.5;
        }
    }
}

//Repeat the process.
alarm[0] = spin_delay;

//Change the turning phase
if (turn == 0)
    turn = 1;
else if (turn == 1)
    turn = 2