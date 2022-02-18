/// @description Get points out of the tape and clear the level

//Play 'Goal' sound
audio_play_sound(snd_goalgate, 0, false);

//Turn the player onto the goal object
with (other) {

    with (instance_create_depth(x, y, -5, obj_mario_gate)) {
    
        yspeed = other.yspeed;
    }
    instance_destroy();
}

//Destroy the tape
instance_destroy();

//Get points
myscore = instance_create_depth(x + 8, y, -4, obj_score);
	
//3up
if (y < ystart-127)
	with (myscore) value = -3;
    
//1-UP
else if (y < ystart-120)
    with (myscore) value = -1;
    
//4000 points
else if (y < ystart-96)
    with (myscore) value = 4000;
    
//1000 points
else if (y < ystart-64)
    with (myscore) value = 1000;
    
//400 points
else if (y < ystart-32)
    with (myscore) value = 400;

//100 points
else
    with (myscore) value = 100;