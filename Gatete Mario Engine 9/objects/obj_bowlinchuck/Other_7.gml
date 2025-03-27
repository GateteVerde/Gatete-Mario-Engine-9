/// @description Set initial frame and throw another ball

//Play 'Hammer' sound
audio_play_sound(snd_hammer, 0, false);

//Stop animation
image_speed = 0;
image_index = 0;

//Set default frame
alarm[2] = 30;

//Create a ball
with (instance_create_depth(x + 16 * xscale, y - 16, -2, obj_bowlinchuck_ball)) {

    //Set the vertical speed
    yspeed = -2.5;
    
    //Set the horizontal speed
    xspeed = 1.5*sign(other.xscale);    
    
    //Boost
    y--;		
}