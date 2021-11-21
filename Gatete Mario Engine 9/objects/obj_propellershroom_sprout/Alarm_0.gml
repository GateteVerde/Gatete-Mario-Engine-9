/// @description Set the new action for the propeller shroom

//Go down
readytogo = 1;

//Check where the player is and set the horizontal movement
if (!instance_exists(obj_mario))
|| (obj_mario.x < x) {

    action = "left";
    hspeed = -0.5;
}
else {

    action = "right";
    hspeed = 0.5;
}