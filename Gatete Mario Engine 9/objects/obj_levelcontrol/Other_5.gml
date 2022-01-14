/// @description Remember P-Switch and G-Switch values

//Remember P-Switch time limit if enabled
if (pswitch_on)
    global.pswitch = alarm[5];
    
//Remember G-Switch time limit if enabled
if (gswitch_on) 
    global.gswitch = alarm[6];