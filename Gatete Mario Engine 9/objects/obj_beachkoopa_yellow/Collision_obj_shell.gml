/// @description Climb inside the shell

//If the shell is being held, inherit default event
if (other.held == 1)
|| (other.yadd != 0)
    with (other) event_inherited();
    
//Otherwise
else {
    
    //If the koopa is jumping inside
	if (ready == 2)
	&& (yadd == 0)
    && (jumping == 1) {
    
		//With the shell
		with (other) {
		
			instance_create_depth(x, y, -2, obj_shell_kamikaze);
			instance_destroy();
		}
		
		//Destroy this koopa
		instance_destroy();
    }
}