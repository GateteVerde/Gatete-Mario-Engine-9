/// @description Ride Yoshi

//If Mario jumps on the Yoshi
if (other.state = playerstate.jump)
&& (other.yspeed > 0)
&& (other.holding = 0)
&& (other.visible = 1)
&& (global.powerup != cs_tiny)
&& (global.powerup != cs_mega)
&& (other.bbox_bottom < yprevious+5) {

    //With the player
    with (obj_mario) {
    
        //Snap into yoshi's position
        x = other.x;
        y = other.y-2;
        
        //Force him to hold yoshi
        holding = 4;
    }

    //Make a Yoshi
    with (instance_create_layer(x, y, "Main", obj_yoshi)) colour = other.colour;

    //Play 'Yoshi' sound
    audio_play_sound(snd_yoshi, 0, false);

    //Destroy
    instance_destroy();
}