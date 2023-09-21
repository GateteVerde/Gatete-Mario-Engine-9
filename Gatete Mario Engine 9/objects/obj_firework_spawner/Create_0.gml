/// @description Spawn a firework

//Play 'Firework' sound
audio_play_sound(snd_firework, 0, false);

//Get 500 points
score += (obj_hud.multiplier * 10);

//Sprite to use
image_speed = 0;
image_index = choose(0, 2, 4, 6);

//Spawn firework
for (i=0; i<11; i++) {

    firework = instance_create_depth(x+8, y+8, layer_get_depth("Tileset_Platform_Background") + 50, obj_firework);
    with (firework) {
    
        //Set the sprite
		image_speed = 0;
        image_index = other.image_index;
        
        //Motion
        motion_set(90+(36*other.i), 3);
    }
}

//Destroy
instance_destroy();