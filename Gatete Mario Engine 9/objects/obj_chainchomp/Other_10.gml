/// @description Manage chain gravity and vertical speed.

//If the chomp is not lunging at Mario.
if (!chomp.lunge) {

    //Set gravity
    if (chain[0].y < chomp.y) chain[0].gravity = 0.25;
    if (chain[1].y < chomp.y) chain[1].gravity = 0.25;
    if (chain[2].y < chomp.y) chain[2].gravity = 0.25;
    if (chain[3].y < chomp.y) chain[3].gravity = 0.25;
    
    //Set the chain distance
    if (chain[0].y < chomp.y-9*maxdist/10) 
        chain[0].y = chomp.y-9*maxdist/10;
    if (chain[1].y < chomp.y-7*maxdist/10) 
        chain[1].y = chomp.y-7*maxdist/10;
    if (chain[2].y < chomp.y-5*maxdist/10) 
        chain[2].y = chomp.y-5*maxdist/10;
    if (chain[3].y < chomp.y-3*maxdist/10) 
        chain[3].y = chomp.y-3*maxdist/10;
}

//Otherwise, if it's lungin'
else if (chomp.lunge) {

    //Stop vertical speed
    chain[0].gravity = 0;
    chain[1].gravity = 0;
    chain[2].gravity = 0;
    chain[3].gravity = 0;
    chain[0].vspeed = 0;
    chain[1].vspeed = 0;
    chain[2].vspeed = 0;
    chain[3].vspeed = 0;
    
    //Set the chain distance
    if (chain[0].y > chomp.y+9*maxdist/10) 
        chain[0].y = chomp.y+9*maxdist/10;
    if (chain[1].y > chomp.y+7*maxdist/10) 
        chain[1].y = chomp.y+7*maxdist/10;
    if (chain[2].y > chomp.y+5*maxdist/10) 
        chain[2].y = chomp.y+5*maxdist/10;
    if (chain[3].y > chomp.y+3*maxdist/10) 
        chain[3].y = chomp.y+3*maxdist/10;
}