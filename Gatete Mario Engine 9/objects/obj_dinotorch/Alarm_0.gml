/// @description Blow flame

//If Mario does not exist
if (!instance_exists(obj_mario)) {

    alarm[0] = 1;
    exit;
}

//If there's no gravity
if (yadd == 0) {

    //If the dino torch is looking at the right
    if (xscale == 1) {
    
        //If Mario is at the right
        if (obj_mario.x > x) {
        
            //Create flame
            flame = instance_create_depth(x+4, y+10, -4, obj_dinotorch_flame);
            
            //With 'flame'
            with (flame) {
            
                image_angle = 0;
                parent = other.id;
            }
            
            //Do not animate
            image_speed = 0;
            image_index = 0;
            
            //Set the sprite
            sprite_index = spr_dinotorch_blow;
        }
        
        //Otherwise, if the player is not at the right
        else {
        
            //Create flame
            flame = instance_create_depth(x, y+4, -4, obj_dinotorch_flame);
            
            //With 'flame'
            with (flame) {
            
                image_angle = 90;
                parent = other.id;
            }
            
            //Do not animate
            image_speed = 0;
            image_index = 1;
            
            //Set the sprite
            sprite_index = spr_dinotorch_blow;
        }
    }
    
    //Otherwise, if the dino torch is looking at the left
    else if (xscale == -1) {
    
        //If Mario is at the left
        if (obj_mario.x < x) {
        
            //Create flame
            flame = instance_create_depth(x-4, y+10, -4, obj_dinotorch_flame);
            
            //With 'flame'
            with (flame) {
            
                image_angle = 180;
                parent = other.id;
            }
            
            //Do not animate
            image_speed = 0;
            image_index = 0;
            
            //Set the sprite
            sprite_index = spr_dinotorch_blow;
        }
        
        //Otherwise, if the player is not at the left
        else {
        
            //Create flame
            flame = instance_create_depth(x, y+4, -4, obj_dinotorch_flame);
            
            //With 'flame'
            with (flame) {
            
                image_angle = 90;
                parent = other.id;
            }
            
            //Do not animate
            image_speed = 0;
            image_index = 1;
            
            //Set the sprite
            sprite_index = spr_dinotorch_blow;
        }
    }
    
    //Stop him
    xspeed = 0;
    
    //Stop blowing flame
    alarm[1] = 120;
}

//Otherwise, wait
else
    alarm[0] = 1;