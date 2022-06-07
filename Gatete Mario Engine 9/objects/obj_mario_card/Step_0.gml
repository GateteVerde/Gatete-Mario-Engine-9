/// @description Card Mario logic

//Inherit the parent event
event_inherited();

//Animate cape if it is visible
cape_anim += 0.065+abs(xspeed)/7.5;

//Animate Yoshi if riding one
anim += 0.065+abs(xspeed)/7.5;
if (anim > 2.99) {
	
	anim = 0;
}

//If the player did not exit the view
if (ready == 0)
&& (x > room_width+32)
&& (audio_is_playing(mygoal.stream) == false) {

    //The player exited the view
    ready = 1;
    
    //Stop him
    xspeed = 0;
    
    //Take points out off time and add it to score
    event_user(15);
}

//Make it move when landed
if (yadd == 0)
    xspeed = 1.5;
	
//Make sure to set the alt exit if the card is a secret one
if (mygoal.secret_exit == true)
    global.clear = 2;