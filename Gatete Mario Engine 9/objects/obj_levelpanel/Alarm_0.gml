/// @description Remember checkpoint for this level

if (global.checkpoint != noone)
&& (place_meeting(x + 8, y + 8, obj_mapmario)) {

    //Remember checkpoint
    checkpoint = global.checkpoint;
    
    //Reset global checkpoint
    global.checkpoint = noone;
}