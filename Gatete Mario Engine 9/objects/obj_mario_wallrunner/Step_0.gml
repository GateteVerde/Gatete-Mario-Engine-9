/// @description Wall running logic

//If Mario does not exist or he is transforming, destroy
if (!instance_exists(obj_mario)) 
|| (instance_exists(obj_mario_transform)) {
	
    instance_destroy();
    exit;
}

//Set up the sprite
sprite_index = global.run_sprite[global.powerup];

//Snap Mario in position and stop him
isflashing = obj_mario.isflashing;
obj_mario.xspeed = 0;
obj_mario.yspeed = 0;
obj_mario.x = x;
obj_mario.y = y+16;

//If the 'Jump' key is pressed
if (input_check_pressed(input.action_0)) {

	//Play 'Jump' sound
	audio_play_sound(snd_jump, 0, false);
	
	//If Mario is moving up
	if (direction == 90) {
	
		obj_mario.yspeed = vspeed;
		obj_mario.xspeed = -3 * direct;
	}
	
	//Otherwise, if Mario is moving down
	else if (direction == 270) {
	
		obj_mario.yspeed = vspeed;
        obj_mario.xspeed = 3 * direct
	}
	
	//Otherwise
	else {
		
		obj_mario.xspeed = hspeed;
		obj_mario.yspeed = 3;
	}
	
	//Destroy
	instance_destroy();
}

//Otherwise, if moving in a clockwise motion
else if (direct == 1) {

	//Speed up if the run and right key is being pressed
    if ((input_check(input.action_1)) && ((input_check(input.right)) || (gamepad_axis_value(0, gp_axislh) > 0.5)))
        speed += 0.1;

    //Otherwise, slow down
    else
        speed -= 0.05;
			

    //If Mario is running up a wall on the right
    if (direction == 90) {

        //Destroy self if there is no solid to the right
        if (!place_meeting(x+8, y, obj_solid)) {
			
            obj_mario.xspeed = -vspeed;
            instance_destroy();
        }
    }

    //If Mario is running left on a ceiling
    else if (direction == 180) {

        //Destroy self if there is no solid above
        if (!place_meeting(x, y-8, obj_solid))
        {
            obj_mario.xspeed = hspeed;
            instance_destroy();
        }

        //Check for an inverted right wall triangle
        col = instance_position(x, y-8, obj_walltriangle_cr);
		
		//If there's a triangle in position
        if (col) {
			
            x = col.x-16;
            y = col.y;
            direction = 90;
        }
    }

    //If Mario is running down a wall on the left
    else if (direction == 270) {

        //Destroy self if there is no solid to the left
        if (!place_meeting(x-8, y, obj_solid)) {
			
            obj_mario.yspeed = vspeed;
            instance_destroy();
        }

        //Check for an inverted left wall triangle
        col = instance_position(x-24, y+16, obj_walltriangle_cl);
		
		//If there's a triangle in position
        if (col) {
			
            x = col.x;
            y = col.y+16;
            direction = 180;
        }
    }
}

//Otherwise, if running in a counter-clockwise motion
else if (direct == -1) {

	//Speed up if the run and left key is being pressed
    if ((input_check(input.action_1)) && ((input_check(input.left)) || (gamepad_axis_value(0, gp_axislh) < -.5)))
        speed += 0.1;

    //Otherwise, slow down
    else
        speed -= 0.05;
		
	//If Mario is running up a wall on the left
    if (direction == 90) {

        //Destroy self if there is no solid to the left
        if (!place_meeting(x-8, y, obj_solid)) {
			
            obj_mario.xspeed = vspeed;
            instance_destroy();
        }
    }

    //If Mario is running right on a ceiling
    else if (direction == 0) {

        //Destroy self if there is no solid above
        if (!place_meeting(x, y-8, obj_solid))
        {
            obj_mario.xspeed = hspeed;
            instance_destroy();
        }

        //Check for an inverted left wall triangle
        col = instance_position(x, y-8, obj_walltriangle_cl);
		
		//If there's a triangle in position
        if (col) {
			
            x = col.x+32;
            y = col.y;
            direction = 90;
        }
    }

    //If Mario is running down a wall on the right
    else if (direction == 270)
    {

        //Destroy self if there is no solid to the right
        if (!place_meeting(x+8, y, obj_solid)) {
			
            obj_mario.yspeed = vspeed;
            instance_destroy();
        }

        //Check for an inverted right wall triangle
        col = instance_position(x+24, y+16, obj_walltriangle_cr);
		
		//If there's a triangle in position
        if (col) {
			
            x = col.x+16;
            y = col.y+16;
            direction = 0;
        }
    }
}

//Destroy self if Mario is too slow, or runs into a solid
if ((speed < 1.6) || (place_meeting(x, y, obj_solid))) {
	
    obj_mario.xspeed = hspeed;
	obj_mario.yspeed = vspeed;
    instance_destroy()
}

//Stop Mario from running too fast
else if (speed > 3)
    speed = 3;