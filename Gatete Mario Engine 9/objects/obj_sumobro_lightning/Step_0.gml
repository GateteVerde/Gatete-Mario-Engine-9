/// @description Sumo Bro lightning logic

//Inherit the parent event
event_inherited();

//Blow if no gravity
if (yadd == 0) {

    //If visible, turn invisible and blow
    if (visible) {
    
        //Play 'Flames' sound
        audio_play_sound(snd_flames, 0, false);
        
        //Create 2 adyacent flames
        alarm[0] = 20;
        alarm[1] = 40;
        
        //Turn invisible
        visible = 0;
        
        //Create smoke
        instance_create_depth(x+8, y+8, -4, obj_smoke);
        
        //Create flame in position
        instance_create_depth(x, y+1, -2, obj_sumobro_flame);
    }
}