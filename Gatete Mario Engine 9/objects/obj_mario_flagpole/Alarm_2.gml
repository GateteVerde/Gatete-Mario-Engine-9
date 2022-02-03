/// @description Return to the map after the music is done playing.

if (!audio_is_playing(snd_flagsong)) {

    //If there's not fireworks
    if (global.fireworks == 0)
        end_level();
    
    else {
    
        //If there's more than 1 fireworks
        if (global.fireworks > 1) {
        
            //Spawn a firework
            instance_create_depth(camera_get_view_x(view_camera[0]) + random_range(32, global.gw - 32), camera_get_view_y(view_camera[0]) + random_range(32, 64), -1, obj_firework_spawner);
              
            //Decrease amount of firework
            global.fireworks--;
            
            //Repeat
            alarm[2] = 30;
        }
        else {
        
            //Spawn a firework
            instance_create_depth(camera_get_view_x(view_camera[0]) + random_range(32, global.gw - 32), camera_get_view_y(view_camera[0]) + random_range(32, 64), -1, obj_firework_spawner);
              
            //Decrease amount of firework
            global.fireworks = 0;
            
            //Repeat
            alarm[2] = 120;        
        }
    }
}
else
    alarm[2] = 1;