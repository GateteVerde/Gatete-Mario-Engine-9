/// @description Wallrunner logic

//If the player does not exist or the player is transforming
if (!instance_exists(obj_mario))
|| (instance_exists(obj_mario_transform)) {

    //Destroy and exit
    instance_destroy();
    exit;
}

//Update sprite
sprite_index = global.run_sprite[global.powerup]

//Animation
image_speed = 0.4;

//Snap player
obj_mario.xspeed = 0;
obj_mario.yspeed = 0;
obj_mario.x = x;
obj_mario.y = y;

//Jumping
if (input_check_pressed(input.action_0)) {

    //Play 'Jump' sound
    audio_play_sound(snd_jump, 0, false);

    //Make the player jump
    with (obj_mario) {
    
        yspeed = other.vspeed;
        xspeed = -3*other.xscale;
        xscale = -xscale;
        angle = 45;
        alarm[4] = 4;
    }
    
    //Destroy
    instance_destroy();
}

//If the player is running in a clockwise movement
else if (xscale > 0) {

    //If the player can turn and there's not a wall at the right
    if (ready)
    && (!collision_rectangle(bbox_right+4, bbox_top, bbox_right+8, bbox_bottom, obj_solid, 0, 0)) {
    
        //With the player
        with (obj_mario) {
        
            xspeed = other.speed;
            pmeter = 144;
            angle = 45;
            x += 4.5;
            alarm[4] = 4;
        }
        
        //Destroy
        instance_destroy();
    }

    //If both 'Control' and 'Right' are held
    if ((input_check(input.action_1)) && ((input_check(input.right)) || (gamepad_axis_value(0, gp_axislh) > 0.5)))
        speed += .1;
    else
        speed -= .05;
}

//If the player is running on a counter-clockwise movement
else if (xscale < 0) {
    
    //If the player can turn and there's not a wall at the right
    if (ready)
    && (!collision_rectangle(bbox_left-8, bbox_top, bbox_left-4, bbox_bottom, obj_solid, 0, 0)) {
    
        //With the player
        with (obj_mario) {

            xspeed = other.speed*-1;
            pmeter = 144;
            angle = 315;
            x -= 4.5;
            alarm[4] = 4;
        }
        
        //Destroy
        instance_destroy();
    }
    
    //If both 'Control' and 'Left' are held
    if ((input_check(input.action_1)) && ((input_check(input.left)) || (gamepad_axis_value(0, gp_axislh) < -0.5)))
        speed += .1;
    else
        speed -= .05;
}

//If the player slows down or makes contact with a solid
if (speed < 1.3) 
|| ((ready) && (position_meeting(x, y, obj_solid))) {

    //With the player
    with (obj_mario) {
    
        xspeed = other.hspeed;
        yspeed = other.vspeed;
        angle = 315;
        alarm[4] = 4;
    }
    
    //Destroy
    instance_destroy();
}

//Update flashing
isflashing = obj_mario.isflashing;

//Cap maximum speed
if (speed > obj_mario.xspeedmax)
    speed = obj_mario.xspeedmax;