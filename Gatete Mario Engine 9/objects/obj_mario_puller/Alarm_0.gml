/// @description Make Mario visible and destroy

//Force visibility of Mario
with (obj_mario) {

    visible = 1;
    holding = 0;
    enable_control = true;
}

//Destroy
instance_destroy();