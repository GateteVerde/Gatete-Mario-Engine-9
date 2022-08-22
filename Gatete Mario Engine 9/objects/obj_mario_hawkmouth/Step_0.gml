/// @description Prepare to give bonus

if (ready == 0) {

    //If the hawkmouth closed it's mouth
    if (myhawk.ready == 5) {
    
        //Stop him inside the mouth
        ready = 1;
        
        //Stop speed
        speed = 0;
        
        //Take points off time and add it to score
        alarm[0] = 120;
    }
}

//Animate cape if it is visible
cape_anim += 0.065+abs(hspeed)/7.5;

//Animate Yoshi if riding one
anim += 0.065+abs(hspeed)/7.5;
if (anim > 2.99) {
	
	anim = 0;
}

//Make sure to set the alt exit if the hawk is a secret one
if (myhawk.secret_exit == true)
    global.clear = 2;