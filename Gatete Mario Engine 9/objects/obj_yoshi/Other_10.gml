/// @description Spit out an item

//Play 'Spit' sound
audio_play_sound(snd_yoshi_spit, 0, false);

//Stop 'Flying' sound
if (flying == 1) {
	
	audio_stop_sound(snd_yoshi_fly);
}

//Spit out the item
if (obj_mario.crouch) 
|| (obj_mario.sliding) {
	
	//Put fire on yoshi if he is red and is holding any shell
	if ((colour = 1) && (mouthholder == obj_shell_kicked))
	|| (mouthsprite == spr_shell_red) 
	|| (mouthsprite == spr_shell_red_classic)
	|| (mouthsprite == spr_shell_spin)
		mouthholder = obj_yoshi_fire;

    //Lock it
    locked = 2;
    
    //If there's fire inside yoshi's mouth
    if (mouthholder == obj_yoshi_fire) {
    
        //Play 'Flames' sound
        audio_play_sound(snd_flames, 0, false);
        
        //Make yoshi fire
        instance_create_depth(x+(10*obj_mario.xscale), y-12, -2, obj_yoshi_fire);
        with (instance_create_depth(x+(10*obj_mario.xscale), y-12, -2, obj_yoshi_fire)) 
            yspeed = 1;
        with (instance_create_depth(x+(10*obj_mario.xscale), y-12, -2, obj_yoshi_fire)) 
            yspeed = -1;         
    }
	
	//Otherwise, if there's ice inside yoshi's mouth
	else if (mouthholder == obj_yoshi_ice) {
	
		//Play 'Magic' sound
		audio_play_sound(snd_magic, 0, false);
		
		//Make yoshi fire ice
        instance_create_depth(x+(10*obj_mario.xscale), y-12, -2, obj_yoshi_ice);
        with (instance_create_depth(x+(10*obj_mario.xscale), y-12, -2, obj_yoshi_ice)) 
            yspeed = 1;
        with (instance_create_depth(x+(10*obj_mario.xscale), y-12, -2, obj_yoshi_ice)) 
            yspeed = -1;    
	}
	
    //Otherwise, if there's a turnip inside yoshi's mouth
    else if (mouthholder == obj_turnip) {
    
        //Create a turnip
        with (instance_create_depth(x+(10*obj_mario.xscale), y-12, -2, obj_turnip)) {
        
            //Set the motion
            xspeed = 3*obj_mario.xscale;
            yspeed = 0.1;
            
            //Set gravity
            yadd = 0.2;
            
            //Do not held the item
            held = false;
        }
    }
    
    //Otherwise, spit a item
    else {
		
		//If Yoshi has a shell inside, turn it into a non-kicked shell before spitting
		if (mouthholder == obj_shell_kicked)
			mouthholder = obj_shell;

        //Create up an item
        with (instance_create_depth(x+(10*obj_mario.xscale), y-12, -2, mouthholder)) {
        
            //Use the correct sprite
            sprite_index = other.mouthsprite;
            
            //If the eaten item is a throwable brick.
            if (sprite_index == spr_brick_blue_th) 
            || (sprite_index == spr_brick_red_th) 
            || (sprite_index == spr_brick_gray_th) 
			|| (sprite_index == spr_brick_green_th) {
                
                //Set the animation speed
                image_speed = 1;
				
				//Set the shard sprite
				shard_sprite = other.mouthshard;
            }
            
            //Set the horizontal speed
            xspeed = 0.5 * obj_mario.xscale;
        }
    }
}
else {
	
	//Put fire on yoshi if he is red and is holding any shell
	if ((colour = 1) && (mouthholder == obj_shell_kicked))
	|| (mouthsprite == spr_shell_red) 
	|| (mouthsprite == spr_shell_red_classic)
	|| (mouthsprite == spr_shell_spin)
		mouthholder = obj_yoshi_fire;

    //Lock it
    locked = 1;
    
    //If there's fire inside yoshi's mouth
    if (mouthholder == obj_yoshi_fire) {
    
        //Play 'Flames' sound
        audio_play_sound(snd_flames, 0, false);
        
        //Make yoshi fire
        instance_create_depth(x+(10*obj_mario.xscale), y-16, -2, obj_yoshi_fire);
        with (instance_create_depth(x+(10*obj_mario.xscale), y-16, -2, obj_yoshi_fire)) 
            yspeed = 1;
        with (instance_create_depth(x+(10*obj_mario.xscale), y-16, -2, obj_yoshi_fire)) 
            yspeed = -1;         
    }
	
	//Otherwise, if there's ice inside yoshi's mouth
	else if (mouthholder == obj_yoshi_ice) {
	
		//Play 'Magic' sound
		audio_play_sound(snd_magic, 0, false);
		
		//Make yoshi fire ice
        instance_create_depth(x+(10*obj_mario.xscale), y-16, -2, obj_yoshi_ice);
        with (instance_create_depth(x+(10*obj_mario.xscale), y-16, -2, obj_yoshi_ice)) 
            yspeed = 1;
        with (instance_create_depth(x+(10*obj_mario.xscale), y-16, -2, obj_yoshi_ice)) 
            yspeed = -1;    
	}
    
    //Otherwise, if there's a turnip inside yoshi's mouth
    else if (mouthholder == obj_turnip) {
    
        //Create a turnip
        with (instance_create_depth(x+(10*obj_mario.xscale), y-16, -2, obj_turnip)) {
        
            //Set the motion
            xspeed = 3*obj_mario.xscale;
            yspeed = 0.1;
            
            //Set gravity
            yadd = 0.2;
            
            //Do not held the item
            held = false;
        }
    }
    
    else {
    
        //Create up an item
        with (instance_create_depth(x+(10*obj_mario.xscale), y-16, -2, mouthholder)) {
        
            //Use the correct sprite
            sprite_index = other.mouthsprite;
            
            //Set the correct direction
            dir = other.image_xscale;
            
            //If the eaten item is a throwable brick
            if (sprite_index == spr_brick_blue_th) 
            || (sprite_index == spr_brick_red_th) 
            || (sprite_index == spr_brick_gray_th) 
			|| (sprite_index == spr_brick_green_th) {
				
				//Set the shard sprite
				shard_sprite = other.mouthshard;
                
                //Set the horizontal speed.
                xspeed = 2.7*obj_mario.xscale;
                
                //Set the animation speed
                image_speed = 1;
                
                //Get thrown
                ready = 1;
                
                //Do not destroy
                alarm[0] = -1;
                alarm[1] = -1;
                
                //If the object is in contact with a solid.
                if (place_meeting(x, y, obj_solid))
                    event_user(0);
            }
            
            //Otherwise if the eaten item is a shell
            else if (sprite_index == spr_shell)
			|| (sprite_index == spr_shell_blue)
			|| (sprite_index == spr_shell_yellow)
			|| (sprite_index == spr_shell_classic) 
			|| (sprite_index == spr_shell_koopatrol) {
                            
                //Set the horizontal speed
                prevxspeed = 2.7*obj_mario.xscale;
                xspeed = 2.7*obj_mario.xscale;
                
                //If the object is in contact with a solid.
                if (place_meeting(x, y, obj_solid)) {
				
					killer_id = -1;
                    event_user(0);
				}
            }
            
            //Otherwise, spit a regular item
            else {
				
				//If the sprite is from a galoomba
				if (sprite_index == spr_galoomba_down)
				|| (sprite_index == spr_galoomba_red_down)
				|| (sprite_index == spr_goombud_down) {
					
					//Set the horizontal speed
					xspeed = 2.7*obj_mario.xscale;
				
					//If the object is in contact with a solid.
	                if (place_meeting(x, y, obj_solid)) {
						
						killer_id = -1;
	                    event_user(0);
					}
				}
				
				//Otherwise
				else {
    
	                //If the eaten item is not overlapping a solid.
	                if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_solid, 0, 0)) {
                
	                    //Set the motion when swimming.
	                    if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_swim, 0, 0)) {
                    
	                        if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_slopeparent, 1, 0))
	                            xspeed = obj_mario.xspeed+0.75*obj_mario.xscale;
	                        else
	                            xspeed = 1*obj_mario.xscale;                
	                    }
                    
	                    //Otherwise, set the motion when NOT swimming.
	                    else {
                    
	                        if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_slopeparent, 1, 0))
	                            xspeed = obj_mario.xspeed+1.5*obj_mario.xscale;
	                        else
	                            xspeed = 2*obj_mario.xscale;                
	                    }
	                }
                
	                //Make the item get not stuck on a solid.
	                else
	                    inwall = true;
				}
            }
        }
    }
}

//Reset mouth item
mouthholder = noone;

//Reset item sprite
mouthsprite = noone;

//Reset shard sprite
mouthshard = noone;

//Force end flight
flying = 0;

//Licking
licking = 1;

//Stop licking
alarm[2] = 5;

//Lick animation
anim = 0;