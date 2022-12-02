/// @description The level controller

//Play music
alarm[0] = 2;
    
//The music of the level
levelmusic = noone;

//Is music disabled?
musicdisable = false;

//Barrier
barrier = false;
alarm[7] = 3;

//Object to follow
follow = noone;

//P-SWitch warning
pswitch_on = 0;
pswitch_warn = 0;

//Gray P-Switch warning
gswitch_on = 0;
gswitch_warn = 0;

//Reach last ground Y
floorY = 0;

//Create HUD
instance_create_layer(0, 0, "GUI", obj_hud);

//Shake variables
shake_intensity = 0;
shake_time = 0;
shake_falloff = 0;

//Used for calculating falloff
shake_starttime = 0;

//Create reverb effect and modify properties
_ef_reverb = audio_effect_create(AudioEffectType.Reverb1);
_ef_reverb.bypass = (reverb == 1) ? false : true;
_ef_reverb.size = 0.6;
_ef_reverb.mix = 0.5;
        
//Apply to main bus
audio_bus_main.effects[0] = _ef_reverb;