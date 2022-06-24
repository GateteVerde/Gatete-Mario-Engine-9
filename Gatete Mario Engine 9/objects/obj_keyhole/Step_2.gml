/// @description Open the secret exit

if (ready != 0)
	exit;

var key = instance_place(x, y, obj_key);

if (key)
{
	//If the animation has not started and the player brings a key
	if (ready == 0)
	&& (key.held == 1) {
    
	    //Begin key sequence
	    event_user(0);

	    //Save the state of the key
	    kx = round(key.x);
	    ky = round(key.y)+1;
	    kd = key.dir;

	    //Delete the key
	    with (key)
			instance_destroy()

	    //Save the state of Mario, and delete him
	    with (obj_mario) {
    
	        //X Position
	        other.mx = x;
        
	        //Y Position
	        other.my = y+1;
        
	        //Sprite
	        other.ms = sprite_index;
        
	        //Frame
	        other.mi = image_index;
        
	        //Facing direction
	        other.md = xscale;
        
	        //Destroy
	        instance_destroy();
	    }

	    //Return to the world map after the animation
	    alarm[0] = 130;
	}
}

var yoshi = instance_place(x, y, obj_yoshi);

if (yoshi)
{
	if (ready == 0)
	&& (instance_exists(obj_mario))
	&& (!instance_exists(obj_yoshi_tongue))
	&& (yoshi.mouthholder == obj_key) {
    
	    //Remember colour
	    global.mountcolour = yoshi.colour;    
    
	    //Begin key sequence
	    event_user(0);
    
	    //Save the state of the key
	    kx = -1000;
	    ky = -1000;
	    kd = 0;
    
	    //Save the state of Mario, and delete him
	    with (yoshi) {
    
	        //X Position
	        other.mx = x;
        
	        //Y Position
	        other.my = y+1;
        
	        //Sprite
	        other.ms = sprite_index;
        
	        //Frame
	        other.mi = image_index;
        
	        //Facing direction
	        other.md = image_xscale;
	    }
	
		//Destroy Mario
		with (obj_mario)
			instance_destroy();

	    //Return to the world map after the animation
	    alarm[0] = 120;
	}
}