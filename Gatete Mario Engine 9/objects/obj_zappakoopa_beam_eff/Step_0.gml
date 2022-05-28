/// @description Decrement alpha

//If the target exists
if (instance_exists(target)) {

    //Move towards target
    move_towards_point(target.x, target.y, 1);
    
    //Destroy if in target
    if (x == target.x)
    && (y == target.y) {
    
        instance_destroy();
    }
}
else {

    instance_destroy();
    exit;
}

//Scale down
scale -= 0.05;
alpha -= 0.025;
if (alpha < 0.025)
    instance_destroy();
