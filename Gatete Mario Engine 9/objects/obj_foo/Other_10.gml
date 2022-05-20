/// @description Custom dead script

//Repeat 10 times
repeat (10) {

    with (instance_create_depth(x, y, -6, obj_foo_fog)) {
    
        motion_set(random(360), random_range(0.25,0.5));
        scale = 0.5;
    }
}

//Destroy
instance_destroy();
