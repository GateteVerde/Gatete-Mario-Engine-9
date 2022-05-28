/// @description Destroy and make parent object move

//Make the parent move again
with (parent) {

    alarm[4] = 30;
}

//Destroy
instance_destroy();
