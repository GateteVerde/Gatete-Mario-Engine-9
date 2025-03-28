/// @description Jump
    
//Do not animate
image_speed = 0;
image_index = 1;
    
//Gravity
yadd = 0.1;
        
//Play 'Trampoline' sound
audio_play_sound(snd_trampoline, 0, false);
            
//Set the vertical speed
yspeed = -6;
y--;