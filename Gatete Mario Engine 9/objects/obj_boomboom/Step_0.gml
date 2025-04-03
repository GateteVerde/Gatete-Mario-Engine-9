/// @description Boom-Boom logic

//Perform obj_enemyparent step event
event_perform_object(obj_enemyparent, ev_step, ev_step_normal);

//Invincibility frames
if (hp > 0) {

    inv--;
    if (inv < 0) {
    
        inv = 0;
        vulnerable = 0;
    }
}
else
    inv = 0;