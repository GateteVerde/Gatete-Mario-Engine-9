/// @description Remember P-Switch and G-Switch values

//End reverb effect
audio_bus_main.effects[0] = undefined;
audio_bus_main.effects[1] = undefined;

//Remember P-Switch time limit if enabled
if (pswitch_on)
    global.pswitch = alarm[5];
    
//Remember G-Switch time limit if enabled
if (gswitch_on) 
    global.gswitch = alarm[6];