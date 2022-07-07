/// @description Make visible, set the position and animate it.

//Play 'Chest' sound
audio_play_sound(snd_chest, 0, false);

//Check where Mario is and move the chest
if (instance_exists(obj_mario)) {

    //If Mario is at the right of the room.
    if (obj_mario.x > room_width/2) {
    
		instance_create_depth(x + 8, y + 8, -6, obj_smoke);
        x = xstart;
        y = ystart;
    }
    
    //Otherwise, if Mario is not at the right of the room.
    else if (obj_mario.x < room_width/2) {
    
		instance_create_depth(x2 + 8, y2 + 8, -6, obj_smoke);
        x = x2;
        y = y2;
    }
}

//Make visible
visible = 1;