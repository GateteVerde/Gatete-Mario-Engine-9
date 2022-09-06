/// @description Projectile Hurt Script

//If the enemy is vulnerable to projectiles
if (vulnerable < 2) {

    //Play 'Kick' sound
    audio_play_sound(snd_kick, 0, false);
    
    //Decrement hits
    firehp--;
    
    //If there's no more fire hits left
    if (firehp == 0) {
    
        //Force set hits
        hp = 1;
        
        //Default hurt script
        event_user(1);
    }
    
    //Otherwise, become invulnerable for a bit.
    else {

        vulnerable = 99;
        inv = 4;
    }
    
    //Destroy projectile
    with (other) event_user(0);
}