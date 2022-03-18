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
		
		//Otherwise, if the shell is a red one, become a red koopa
		else if (other.sprite_index == spr_shell_red) {
		
            //With the shell
            with (other) {
            
                instance_create_depth(x, y, -2, obj_koopa_red);
                instance_destroy();
            }
            
            //Destroy this object
            instance_destroy();			
		}
		
		//Otherwise, if the shell is a blue one, become a blue koopa
		else if (other.sprite_index == spr_shell_blue) {
		
            //With the shell
            with (other) {
            
                instance_create_depth(x, y, -2, obj_koopa_blue);
                instance_destroy();
            }
            
            //Destroy this object
            instance_destroy();			
		}
		
		//Otherwise, if the shell is a yellow one, become a yellow koopa
		else if (other.sprite_index == spr_shell_yellow) {
		
            //With the shell
            with (other) {
            
                instance_create_depth(x, y, -2, obj_koopa_yellow);
                instance_destroy();
            }
            
            //Destroy this object
            instance_destroy();			
		}
    }
}