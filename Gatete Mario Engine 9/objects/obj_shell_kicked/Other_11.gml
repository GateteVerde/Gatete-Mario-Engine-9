/// @description Stop the shell

//Create a new shell
with (instance_create_depth(x, y, -2, obj_shell)) {

    //Hereby sprite
    sprite_index = other.sprite_index;
    
    //Hereby koopainside state
    koopainside = other.koopainside;
    
    //Hereby flip state
    flip = other.flip;
	
	//Force shell mode
	is_shell = 1;
}

//Destroy
instance_destroy();