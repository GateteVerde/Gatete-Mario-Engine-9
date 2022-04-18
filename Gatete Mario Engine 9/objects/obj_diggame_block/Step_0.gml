/// @description Dig block logic

//Check for Mario
var mario = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mario, 0, 0);

//If Mario is passing through, activate it
if (ready == 0) {

    //If Mario passes through, close after Mario passes through
    if (mario)
        ready = 1;    
}

//Otherwise, if Mario passed through, close it.
else if ((ready == 1) && (!mario)) {

    //Play 'Transform' sound
    audio_play_sound(snd_transform, 0, false);
    
    //Close it
    ready = 2;
    
    //Repeat
    var a = 0;
    repeat (image_xscale) {
    
        //Create a solid object
        with (instance_create_depth(x+a, y, -5, obj_solid)) {
        
            //Set the sprite
            sprite_index = other.sprite_index;
            
            //Make it visible
            visible = 1;
        }
        
        //Create some smoke
        instance_create_layer(x+8+a, y+8, -10, obj_smoke);
        
        //Next one
        a += 16;
    }
}