/// @description Climb inside the shell

//If the shell is being held, inherit default event
if (other.held == 1)
    with (other) event_inherited();
    
//Otherwise
else {
    
    //If the koopa is jumping inside
	if (ready == 2)
    && (jumping == 1) {
    
        //If the shell is a green one, become a green koopa
        if (other.sprite_index == spr_shell) {
        
            //With the shell
            with (other) {
            
                instance_create_depth(x, y, -2, obj_koopa);
                instance_destroy();
            }
            
            //Destroy this object
            instance_destroy();
        }
    }
}