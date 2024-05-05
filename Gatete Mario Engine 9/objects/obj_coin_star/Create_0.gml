/// @description Star Coin

//Inherit event from parent
event_inherited();

//Whether this coin was hit with a pow block
ready = 0;

//Bounces
bounces = 3;

//Ignore platforms
ignore_platforms = true;

//If this coin has been collected before, destroy
if (ds_map_find_value(global.sc[type], global.level) > 0) {

    //If the coin is not collected
    if (ds_map_find_value(global.sc[type],global.level) < 3)
        instance_destroy();
    else
        sprite_index = spr_coin_star_get;
}
else
    alarm[2] = 7;