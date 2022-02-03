/// @description Wallrunner logic

//Make the player stay in position
obj_mario.xspeed = 0;
obj_mario.yspeed = 0;
obj_mario.x = x;
obj_mario.y = y;

//Jumping
if (input_check_pressed(input.action_0)) {
	
	//Play 'Jump' sound
	audio_play_sound(snd_jump, 0, false);
	
	//Make Mario visible
    obj_mario.visible = 1;
	
    switch (direction) {
		
		//Right
        case (0): {
			
            obj_mario.xspeed = hspeed;
            obj_mario.yspeed = -3*xscale;
        } break;
		
		//Up
        case (90): {
			
            obj_mario.yspeed = vspeed;
            obj_mario.xspeed = -3*xscale;
        } break;
		
		//Left
        case (180): {
			
            obj_mario.xspeed = hspeed;
            obj_mario.yspeed = 3*xscale;
        } break;
		
		//Down
        case (270): {
			
            obj_mario.yspeed = vspeed;
            obj_mario.xspeed = 3*xscale;
        } break;
    }
	
    //Destroys this object.
    instance_destroy();
}
else {
	
	//If facing right
    if (xscale > 0) {
		
        //If 'Action 1' is being held and the 'Right' key is held
		if ((input_check(input.action_1)) && ((input_check(input.right)) || (gamepad_axis_value(0, gp_axislh) > 0.5)))
			speed += 0.1;

		//Otherwise if the player can stop, slowdown until Mario stops
        else if (can_halt) {
			
			slowdown = true;
		}
		
        //If moving up
        if (direction == 90) {
			
            //Bump into the ceiling
            if (collision_rectangle(bbox_left+4, bbox_top-1+vspeed, bbox_right-4, bbox_top-1, obj_solid, 1, 0)) then slowdown = true;
			
			//If Mario can stop
            if ((can_halt) && (!collision_rectangle(bbox_right+1, bbox_top, bbox_right+8, bbox_bottom, obj_semisolid, 0, 0))) {
				
                obj_mario.yspeed = speed*-1;
                obj_mario.visible = 1;
				y -= (global.powerup == cs_small) ? 8 : 0;
                instance_destroy();
            }
			
            //Check for a right triangle block
            col = instance_position(x+16, y-6, obj_walltriangle_r);
			
			//If there's a triangle
            if ((can_turn) && (col)) {
				
                can_halt = false;
                desired_dir = 0;
                desired_offset_x = 15;
                desired_offset_y = -7;
                desired_speed = speed;
                can_turn = false;
                speed = 0;
                direction = 45;
                x = col.x-4;
                y = col.y-8;
                alarm[0] = 2;
                alarm[1] = 4;
            }
			
            //Check for an inverted right triangle block
            col_b = instance_position(x+6, y-16, obj_walltriangle_cr);
			
			//If there's a triangle
            if ((can_turn) && (col_b)) {
				
                can_halt = false;
                desired_offset_x = -7;
                desired_offset_y = -10;
                desired_dir = 180;
                desired_speed = speed;
                can_turn = false;
                speed = 0;
                direction = 135;
                x = col_b.x-8;
                y = col_b.y+24;
                alarm[0] = 2;
                alarm[1] = 4;
            }
        }
		
		//If moving left
        if (direction == 180) {
			
            //Bump into a wall
            if (collision_rectangle(bbox_left-1+hspeed, bbox_top+4, bbox_left-1, bbox_bottom-4, obj_solid, 0, 0)) then slowdown = true;
			
			//If Mario can stop
            if ((can_halt) && (!collision_rectangle(bbox_left, bbox_top-8, bbox_right, bbox_top-1, obj_semisolid, 0, 0))) {
				
                obj_mario.xspeed = speed*-1;
                obj_mario.visible = 1;
				y -= (global.powerup == cs_small) ? 8 : 0;
                instance_destroy();
            }
			
            //Check for an inverted left triangle block
            col = instance_position(x-16, y-6, obj_walltriangle_cl)
			
			//If there's a triangle
            if ((can_turn) && (col)) {
				
                can_halt = false;
                desired_dir = 270;
                desired_offset_x = -2;
                desired_speed = speed;
                can_turn = false;
                speed = 0;
                direction = 225;
                x = col.x+16;
                y = col.y+16;
                alarm[0] = 2;
                alarm[1] = 4;
            }
			
            //Check for an inverted right triangle block
            col_b = instance_position(x+6, y-16, obj_walltriangle_cr)
			
			//If there's a triangle
            if ((can_turn) && (col_b)) {
				
                can_halt = false;
                desired_dir = 90;
                desired_offset_x = -7;
                desired_offset_y = -15;
                desired_speed = speed;
                can_turn = false;
                speed = 0;
                direction = 135;
                x = col_b.x-8;
                y = col_b.y+15;
                alarm[0] = 2;
                alarm[1] = 4;
            }
        }
		
		//If moving down
        if (direction == 270) {
			
            //Bump into the floor
            if (collision_rectangle(bbox_left+4, bbox_bottom+1, bbox_right-4, bbox_bottom+1+vspeed, obj_semisolid, 0, 0)) then slowdown = true;
			
			//If Mario can stop
            if ((can_halt) && (!collision_rectangle(bbox_left-8, bbox_top, bbox_left-1, bbox_bottom, obj_semisolid, 0, 0))) {
				
                obj_mario.yspeed = speed;
                obj_mario.visible = 1;
				y -= (global.powerup == cs_small) ? 8 : 0;
                instance_destroy();
            }
			
            //Check for an inverted left triangle block
            col = instance_position(x-16, y+16, obj_walltriangle_cl);
			
			//If there's a triangle
            if (can_turn) && (col) {
				
                can_halt = false;
                desired_dir = 180;
                desired_offset_x = -15;
                desired_offset_y = 14;
                desired_speed = speed;
                can_turn = false;
                speed = 0;
                direction = 225;
                x = col.x+24;
                y = col.y+16;
                alarm[0] = 2;
                alarm[1] = 4;
            }
			
            //Check for a left triangle block
            col_b = instance_position(x-6, y+6, obj_walltriangle_l);
			
			//If there's a triangle
            if ((can_turn) && (col_b)) {
				
                can_halt = false;
                desired_dir = 0;
                desired_offset_x = 4;
                desired_offset_y = 3;
                desired_speed = speed;
                can_turn = false;
                speed = 0;
                direction = 315;
                x = col_b.x+16;
                y = col_b.y-8;
                alarm[0] = 2;
                alarm[1] = 4;
            }
        }
    }
	
	//Otherwise, if facing left
    else if (xscale < 0) {
		
		//If 'Action 1' is being held and the 'Left' key is held
		if ((input_check(input.action_1)) && ((input_check(input.left)) || (gamepad_axis_value(0, gp_axislh) < -0.5)))
			speed += 0.1;

		//Otherwise if the player can stop, slowdown until Mario stops
        else if (can_halt) {
			
			slowdown = true;
		}
		
        //If moving up
        if (direction == 90) {
			
            //Bump into the ceiling
            if (collision_rectangle(bbox_left+4, bbox_top-1+vspeed, bbox_right-4, bbox_top-1, obj_solid, 1, 0)) then slowdown = true;
			
			//If Mario can stop
            if ((can_halt) && (!collision_rectangle(bbox_left-8, bbox_top, bbox_left-1, bbox_bottom, obj_semisolid, 0, 0))) {
				
                obj_mario.yspeed = speed*-1;
                obj_mario.visible = 1;
				y -= (global.powerup == cs_small) ? 8 : 0;
                instance_destroy();
            }
			
            //Check for a left triangle block
            col = instance_position(x-16, y-6, obj_walltriangle_l);
			
			//If there's a triangle
            if ((can_turn) && (col)) {
				
                can_halt = false;
                desired_dir = 180;
                desired_offset_x = -15;
                desired_offset_y = -7;
                desired_speed = speed;
                can_turn = false;
                speed = 0;
                direction = 135;
                x = col.x+16;
                y = col.y-8;
                alarm[0] = 2;
                alarm[1] = 4;
            }
			
            //Check for an inverted left triangle block
            col_b = instance_position(x-6, y-16, obj_walltriangle_cl)
			
			//If there's a triangle
            if ((can_turn) && (col_b)) {
				
                can_halt = false;
                desired_dir = 0;
                desired_offset_x = 7;
                desired_offset_y = -9;
                desired_speed = speed;
                can_turn = false;
                speed = 0;
                direction = 45;
                x = col_b.x+16;
                y = col_b.y+24;
                alarm[0] = 2;
                alarm[1] = 4;
            }
        }
		
		//If moving right
        if (direction == 0) {
			
            //Bump into a wall
            if (collision_rectangle(bbox_right+1, bbox_top+4, bbox_right+1+hspeed, bbox_bottom-4, obj_solid, 0, 0)) then slowdown = true;
			
			//If the player can stop
            if ((can_halt) && (!collision_rectangle(bbox_left, bbox_top-8, bbox_right, bbox_top-1, obj_semisolid, 0, 0))) {
				
                obj_mario.xspeed = speed;
                obj_mario.visible = 1;
				y -= (global.powerup == cs_small) ? 8 : 0;
                instance_destroy();
            }
			
            //Check for an inverted left triangle block
            col = instance_position(x-6, y-16, obj_walltriangle_cl);
			
			//If there's a triangle
            if ((can_turn) && (col)) {
				
                can_halt = false;
                desired_dir = 90;
                desired_offset_x = 7;
                desired_offset_y = -15;
                desired_speed = speed;
                can_turn = false;
                speed = 0;
                direction = 45;
                x = col.x+24;
                y = col.y+16;
                alarm[0] = 2;
                alarm[1] = 4;
            }
			
            //Check for an inverted right triangle block
            col = instance_position(x+16, y-6, obj_walltriangle_cr);
			
			//If there's a triangle
            if ((can_turn) && (col)) {
				
                can_halt = false;
                desired_dir = 270;
                desired_speed = speed;
                can_turn = false;
                speed = 0;
                direction = 315;
                x = col.x+1;
                y = col.y+16;
                alarm[0] = 2;
                alarm[1] = 4;
            }
        }
		
		//If moving down
        if (direction == 270) {
			
            //Bump into the floor
            if (collision_rectangle(bbox_left+4, bbox_bottom+1, bbox_right-4, bbox_bottom+1+vspeed, obj_semisolid, 0, 0)) then slowdown = true;
            
			//If Mario can stop
			if ((can_halt) && (!collision_rectangle(bbox_right+1, bbox_top, bbox_right+8, bbox_bottom, obj_semisolid, 0, 0))) {
                
				obj_mario.yspeed = speed;
                obj_mario.visible = 1;
				y -= (global.powerup == cs_small) ? 8 : 0;
                instance_destroy()
            }
			
            //Check for an inverted right triangle block
            col = instance_position(x+24, y-6, obj_walltriangle_cr)
			
			//If there's a triangle
            if ((can_turn) && (col)) {
				
                can_halt = false;
                desired_dir = 0;
                desired_offset_x = 7;
                desired_offset_y = 7;
                desired_speed = speed;
                can_turn = false;
                speed = 0;
                direction = 315;
                x = col.x;
                y = col.y+24;
                alarm[0] = 2;
                alarm[1] = 4;
            }
			
            //Check for a right triangle block
            col_b = instance_position(x+6, y+6, obj_walltriangle_r);
			
			//If there's a triangle
            if ((can_turn) && (col_b)) {
				
                can_halt = false;
                desired_dir = 180;
                desired_offset_x = -15;
                desired_offset_y = 7;
                desired_speed = speed;
                can_turn = false;
                speed = 0;
                direction = 225;
                x = col_b.x;
                y = col_b.y-8;
                alarm[0] = 2;
                alarm[1] = 4;
            }
        }
    }
	
    //If the player bumps into a wall or slows down at any point...
    if ((collision_rectangle(bbox_left+4, bbox_top+4, bbox_right-4, bbox_bottom-4, obj_solid, 0, 0)) || (slowdown))
    if (can_halt) {
		
        //Keep momentum of not hitting a wall
        if (slowdown) {
			
            obj_mario.xspeed = lengthdir_x(speed, direction);
            obj_mario.yspeed = lengthdir_y(speed, direction);
        }
		
		//Make Mario visible and destroy this object
        obj_mario.visible = 1;
        instance_destroy()
    }
}

//Update flashing
isflashing = obj_mario.isflashing;

//Set Terminal Velocity (Has a specific velocity in order to read collision detection much easier)
speed = min(speed, 3.3);