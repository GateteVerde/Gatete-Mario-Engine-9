/// @description Make the Dino-Torch move

//If the parent does exist
if (instance_exists(parent)) {

    //Make the dino torch move
    with (parent) alarm[10] = 30;
    
    //Destroy
    instance_destroy();
}

//Otherwise, wait
else
    alarm[1] = 1