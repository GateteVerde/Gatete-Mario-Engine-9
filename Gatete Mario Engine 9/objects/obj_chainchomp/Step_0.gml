/// @description Manage the chain position

//If the chomp exists
if (instance_exists(chomp)) {

    //If the chain is below the chomp
    if (chain[0].x > chomp.x+9*maxdist/10) 
        chain[0].x = chomp.x+9*maxdist/10;
    if (chain[1].x > chomp.x+7*maxdist/10) 
        chain[1].x = chomp.x+7*maxdist/10;
    if (chain[2].x > chomp.x+5*maxdist/10) 
        chain[2].x = chomp.x+5*maxdist/10;
    if (chain[3].x > chomp.x+3*maxdist/10) 
        chain[3].x = chomp.x+3*maxdist/10;
    
    //Otherwise if it's above the chomp.
    if (chain[0].x < chomp.x-9*maxdist/10) 
        chain[0].x = chomp.x-9*maxdist/10;
    if (chain[1].x < chomp.x-7*maxdist/10) 
        chain[1].x = chomp.x-7*maxdist/10;
    if (chain[2].x < chomp.x-5*maxdist/10) 
        chain[2].x = chomp.x-5*maxdist/10;
    if (chain[3].x < chomp.x-3*maxdist/10) 
        chain[3].x = chomp.x-3*maxdist/10;
    
    //Manage chain gravity
    event_user(0);
    
    //If the chain chomp is taunting
    if (taunt)    
        event_user(1);
}
