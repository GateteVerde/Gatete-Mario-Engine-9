/// @description Pulled vegetable logic

//Destroy if Mario does not exist
if (!instance_exists(obj_mario)) {

    instance_destroy();
    exit;
}

//If the veggie is almost pulled
if (ready == 2) {

    //If the player does exist
    if (instance_exists(obj_mario)) {
    
        //With the player
        with (obj_mario) {
        
            visible = 1;
            holding = 0;
            enable_control = true;
        }
        
        //Destroy puller
        with (obj_mario_puller) instance_destroy();
    }

    //If the vegetable is a bomb
    if (myveggie == obj_turnip_bomb) 
        with (instance_create_depth(obj_mario.x, obj_mario.y-5, -4, obj_turnip_bomb)) aa = other.aa;
        
    //Otherwise, if the vegetable is a gachapon_ball
    else if (myveggie == obj_gachapon_up) {
		
        with (instance_create_depth(obj_mario.x, obj_mario.y-5, -4, obj_gachapon_up))
            image_index = other.image_index;
    }
    
    //Otherwise, if the vegetable is a mushroom
    else if (myveggie == obj_mushroom) {
		
	    with (instance_create_depth(obj_mario.x, obj_mario.y, -2, obj_mushroom)) {
			
			xspeed = 1 * sign(obj_mario.xscale);
			yspeed = -4;
		}
	}
        
    //Otherwise, if the vegetable is a 1up mushroom
    else if (myveggie == obj_1up) {
		
	    with (instance_create_depth(obj_mario.x, obj_mario.y, -2, obj_1up)) {
			
			xspeed = 1 * sign(obj_mario.xscale);
			yspeed = -4;
		}
	}
	
    //Otherwise, if the vegetable is a poison mushroom
    else if (myveggie == obj_poison) {
		
        with (instance_create_depth(obj_mario.x, obj_mario.y, -2, obj_poison)) {
			
			xspeed = 1 * sign(obj_mario.xscale);
			yspeed = -4;
		}
	}
        
    //Otherwise, if the vegetable is a crystal ball
    else if (myveggie == obj_crystal_up) {
		
		//Create a pulled crystal
		instance_create_layer(x, y, "Main", obj_crystal_up);
    
        //If the crystal is a blue one, open red hawkmouth
        if (sprite_index == spr_crystal) {
    
            //Open Hawkmouth's mouth
            with (obj_hawkmouth) {
            
                //Make sure this is the red one
                if (sprite_index == spr_hawkmouth) {
                
                    //Do not animate
                    image_speed = 0;
                    image_index = 1;
                    
                    //Prepare to open the mouth
                    ready = 1;
                    
                    //Play fanfare
                    alarm[0] = 4;
                    
                    //Open hawkmouth mouth.
                    alarm[1] = 120;
                }
            }
        }
    }
        
    //Otherwise, pull a veggie
    else {
    
        //If the vegetable is a enemy
        if (enemy) {
        
            with (instance_create_depth(obj_mario.x, obj_mario.y+11, -4, myveggie)) {
            
                //Hereby same sprite and frame
                sprite_index = other.sprite_index;
                image_xscale = other.xscale;
                
                //Hereby return enemy
                turnback = other.turnback;
                
                //Hereby timers
                aa = other.aa;                
            }
        }
        
        //Otherwise, pull a normal vegetable
        else {
			
			with (instance_create_depth(obj_mario.x, obj_mario.y+11, -4, myveggie)) {
			
				sprite_index = other.sprite_index;
				image_index = other.image_index;
				held = 1;
			}
		}
    }
    
    //Destroy
    instance_destroy();
}

//Set the y position of the turnip
if (((bbox_bottom < obj_mario.bbox_top+14) && (global.powerup == cs_small))
|| ((bbox_bottom < obj_mario.bbox_top+20) && (global.powerup >= cs_big)))
&& (ready == 0) {

    //Set the plucking sprite
    with (obj_mario_puller) {
    
        sprite_index = global.duck_sprite[global.powerup];
    }

    //Pull out
    alarm[4] = 7;
    ready = 1;
    
    //Stop vertical movement
    vspeed = 0;
    
    //If the player is not small
    if (global.powerup >= cs_big)
        y = obj_mario.bbox_top-2;
    
    //Otherwise, if the player is small
    else if (global.powerup == cs_small)
        y = obj_mario.bbox_top-6;
}

//If the player does not exist...
if (!instance_exists(obj_mario))
    instance_destroy();