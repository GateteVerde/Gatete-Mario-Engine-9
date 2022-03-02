/// @description Red Galoomba Logic

//Inherit the parent event
event_inherited();

//If the galoomba is sleeping
if (charge == 0) 
&& (global.whistle == 0) {

    //If Mario does exist
    if (instance_exists(obj_mario)) {
    
        //If Mario is nearby
        if (obj_mario.x > x-32)
        && (obj_mario.x < x+32) {
        
            //Play 'Chuck Whistle' sound
            audio_play_sound(snd_chuck_whistle, 0, false);
        
            //Set the chasing sprite
            sprite_index = spr_galoomba_red;
            
            //Start chasing
            charge = 1;
            
            //Set vertical speed
            yspeed = -3;
        }
    }
}
else {

    //Previous xspeed
    prevxspeed = xspeed;
    
    //If the direction changed, speed up
    if (xspeed != prevxspeed) {
    
        xspeed = sign(xspeed)*1.5;
        if (yadd == 0) {
        
            yspeed = -1.5;
            y--;
        }
    }
        
    //Keep charging at Mario
    if (charge == 1) {
    
        //If there's no yadd
        if (yadd == 0) {
            
            //Follow Mario
            if (!instance_exists(obj_mario))
            || (obj_mario.x < x) {
            
                xspeed -= 0.0324;
                if (xspeed < -1.5)
                    xspeed = -1.5;
            }
            else {
            
                xspeed += 0.0324;
                if (xspeed > 1.5)
                    xspeed = 1.5;
            }
        }
    }
}

//Face towards Mario
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    xscale = -1;
else
    xscale = 1;