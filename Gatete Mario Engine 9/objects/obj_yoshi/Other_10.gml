/// @description Spit out an item

//Play 'Spit' sound
audio_play_sound(snd_yoshi_spit, 0, false);

//Spit out the item
if (obj_mario.crouch) 
|| (obj_mario.sliding) {

	/*
    //If the item held is a koopa shell, turn into a kicked koopa shell
    if (mouthholder == obj_shell) {
    
        if (colour == 1)
        || (mouthsprite == spr_koopa_black)
        || (mouthsprite == spr_shell_red_down)
            mouthholder = obj_yoshi_fire;
    }
	*/

    //Lock it
    locked = 2;
    
    //If there's fire inside yoshi's mouth
    if (mouthholder == obj_yoshi_fire) {
    
        //Play 'Flames' sound
        audio_play_sound(snd_flames, 0, false);
        
        //Make yoshi fire
        instance_create_depth(x+(10*obj_mario.xscale), y-12, -2, obj_yoshi_fire);
        with (instance_create_depth(x+(10*obj_mario.xscale), y-12, -2, obj_yoshi_fire)) 
            vspeed = 1;
        with (instance_create_depth(x+(10*obj_mario.xscale), y-12, -2, obj_yoshi_fire)) 
            vspeed = -1;         
    }
    
    //Otherwise, spit a item
    else {

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

	/*
    //If the item held is a koopa shell, turn into a kicked koopa shell
    if (mouthholder == obj_shell) {
    
        if (colour == 1)
        || (mouthsprite == spr_koopa_black)
        || (mouthsprite == spr_shell_red_down)
            mouthholder = obj_yoshi_fire;
        else
            mouthholder = obj_shell_kick;
    }
	*/

    //Lock it
    locked = 1;
    
    //If there's fire inside yoshi's mouth
    if (mouthholder == obj_yoshi_fire) {
    
        //Play 'Flames' sound
        audio_play_sound(snd_flames, 0, false);
        
        //Make yoshi fire
        instance_create_depth(x+(10*obj_mario.xscale), y-16, -2, obj_yoshi_fire);
        with (instance_create_depth(x+(10*obj_mario.xscale), y-16, -2, obj_yoshi_fire)) 
            vspeed = 1;
        with (instance_create_depth(x+(10*obj_mario.xscale), y-16, -2, obj_yoshi_fire)) 
            vspeed = -1;         
    }
    
    //Otherwise, if there's a turnip inside yoshi's mouth
    else if (mouthholder == obj_turnip) {
    
        //Create a turnip
        with (instance_create_depth(x+(10*obj_mario.xscale), y-16, -2, obj_turnip)) {
        
            //Use the correct sprite
            sprite_index = other.mouthsprite;
        
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
            
			/*
            //Otherwise, if the eaten item is a ice block
            else if (sprite_index == spr_iceblock) {
            
                //Set the horizontal speed
                hspeed = 2.7*obj_mario.xscale;
                
                //Get thrown
                ready = 1;
                
                //Do not destroy
                alarm[0] = -1;
                alarm[1] = -1;
                
                //If the object is in contact with a solid.
                if (place_meeting(x,y,obj_solid))
                    event_user(0);
            }
            
            //Otherwise if the eaten item is a shell
            else if (sprite_index == spr_shell_down) 
            || (sprite_index == spr_shell_blue_down) 
            || (sprite_index == spr_shell_yellow_down) {
                            
                //Set the horizontal speed
                prevhspeed = 2.7*obj_mario.xscale;
                xspeed = 2.7*obj_mario.xscale;
                
                //Get thrown
                ready = 1;
                
                //If the object is in contact with a solid.
                if (place_meeting(x,y,obj_solid))
                    event_user(0);            
            }
			*/
            
            //Otherwise, spit a regular item
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

//Reset mouth item
mouthholder = noone;

//Reset item sprite
mouthsprite = noone;

//Reset shard sprite
mouthshard = noone;

//Licking
licking = 1;

//Stop licking
alarm[2] = 5;

//Lick animation
anim = 0;