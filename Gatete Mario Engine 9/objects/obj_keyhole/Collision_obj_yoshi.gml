/// @description Open the secret exit

//If the animation has not started and Mario brings a key
if (ready == 0)
//&& (instance_exists(obj_mario))
&& (other.mouthholder == obj_key) {
    
    //Remember colour
    global.mountcolour = obj_yoshi.colour;    
    
    //Begin key sequence
    event_user(0);
    
    //Save the state of the key
    kx = -1000;
    ky = -1000;
    kd = 0;
    
    //Save the state of Mario, and delete him
    with (obj_yoshi) {
    
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
	with (obj_mario) instance_destroy();

    //Return to the world map after the animation
    alarm[0] = 120;
}