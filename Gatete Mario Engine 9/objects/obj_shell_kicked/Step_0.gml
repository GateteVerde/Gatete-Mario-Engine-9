/// @description Kicked Koopa Shell logic

//Previous horizontal speed
prevxspeed = xspeed;    

//Inherit event
event_inherited();

//Check for 1 block gaps and blocks in the way
event_user(5);

//If the direction changes...
if (sign(xspeed) != sign(prevxspeed)) {

    //If the item is not outside
    if (outside_view() == false) {
    
        //Play 'Bump' sound
        audio_play_sound(snd_bump, 0, false);
    }
    
    //Create shell thump
	with (instance_create_depth(x+(5*sign(prevxspeed)), y, -6, obj_shellthump)) bump = true;
}