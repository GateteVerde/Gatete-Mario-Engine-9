/// @description Collision with Mario

//Inherit event
event_inherited();

//If just spun on, give a moment to be spun on again
if (other.bbox_bottom < bbox_top-vspeed+5) {

    if ((other.jumpstyle == 1) || (global.mount > 0)) {
    
        alarm[4] = 5;
        stomp = -1;
    }   
}
