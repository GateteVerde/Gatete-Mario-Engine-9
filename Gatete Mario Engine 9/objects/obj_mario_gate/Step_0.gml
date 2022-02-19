/// @description Gate Mario logic

//Inherit step event
event_inherited();

//Animate cape if it is visible
cape_anim += 0.065+abs(xspeed)/7.5;

//Animate Yoshi if riding one
anim += 0.065+abs(xspeed)/7.5;
if (anim > 2.99) {
	
	anim = 0;
}

//Close curtain and go to map
if (ready3 == 1)
&& (global.timer == 0)
&& (audio_is_playing(snd_goalgate_b) == false) {

    //Close curtain
    ready3 = 2;
    
    //Create curtain effect
    instance_create_depth(0, 0, -11, obj_goalgate_curtain);
}

//Make the screen fade out
if (ready2 == 1) {

    //If the fade object exists
    if (instance_exists(obj_goalgate_fade))
        with (obj_goalgate_fade) fade = 2;
}

//Increment speed
if (ready3 == 2) {

    //Build up some speed
    xspeed += 0.05;
    
    //Prevent it from going too fast
    if (xspeed > 1.75)
        xspeed = 1.75;
}