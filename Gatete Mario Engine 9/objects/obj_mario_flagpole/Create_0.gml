/// @description Mario sliding down the flagpole

//Inherit event from parent
event_inherited();

//Remove every NPC on screen
with (obj_physicsparent) {

    //Do this only if inside the view
    if (outside_view() == false) {
    
        //If the object is ancestor of either holdparent, enemyparent or powerup parent
        if (object_is_ancestor(object_index, obj_holdparent))
        || (object_is_ancestor(object_index, obj_enemyparent))
        || (object_is_ancestor(object_index, obj_powerupparent)) {
        
            //Give points
            instance_create_depth(round(bbox_left+bbox_right)/2, y, -2, obj_enemy_score);
        
            //Create poof of smoke
            instance_create_depth(round(bbox_left+bbox_right)/2, round(bbox_top+bbox_bottom)/2, -2, obj_smoke);
            
            //Destroy
            instance_destroy();
        }
    }
}

//Default flagpole
flagpole = -1;

//Use the clear sprite
sprite_index = global.goal_sprite[global.powerup];

//Do not animate
image_speed = 0;

//Stop both music and timer
with (obj_levelcontrol) {

    event_user(0);
    alarm[2] = 0;
}

//Clear the level
global.clear = 1;
if (instance_exists(obj_flagpole_secret)) {

    global.clear = 2;
}

//Anim
anim = 0;
cape_anim = 0;

//Do not swim
noswim = 1;

//Do not flash
isflashing = 0;

//Forget check points
global.checkpoint = noone;

//Do not bring kuribo shoes outside
if (global.mount == 2) {

    //Play 'Power Lost' sound
    audio_play_sound(snd_powerlost, 0, false);
    
    //Forget it
    global.mount = 0;
    
    //With the shoe
    with (obj_kuriboshoe) {
    
        //Create flying shoe
        with (instance_create_depth(x, y, -6, obj_kuriboshoe_lost)) {
        
            sprite_index = other.sprite_index;
            image_xscale = -1;
            hspeed = -1;
        }
        
        //Destroy
        instance_destroy();
    }
}

//State
ready = 0;
ready2 = 0;
ready3 = 0;

//Hold a bit before going down
alarm[11] = 60;

//Get number of fireworks
if ((global.timer mod 10) == 6) 
    global.fireworks = 6;
else if ((global.timer mod 10) == 3) 
    global.fireworks = 3;
else if ((global.timer mod 10) == 1) 
    global.fireworks = 1;