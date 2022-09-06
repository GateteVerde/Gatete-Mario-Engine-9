/// @description Default boss death script (Creates orb and destroys)

//Create orb if there no boss parents left
if (instance_number(obj_bossparent) == 1) {

    //Play 'Orb' sound
    audio_play_sound(snd_defeat, 0, false);

    //Create Orb
    with (instance_create_depth(x, y, -2, obj_goalorb)) {
		
        yspeed = -5;
		secret_exit = other.secret_exit;
	}
}

//Create smoke
var a;
a = 0;
repeat (8) {

    with (instance_create_depth(x, y+8, -6, obj_smoke)) {
    
        motion_set(0+(45*a), 2);
        a += 45;
    }
}

//Destroy
instance_destroy();