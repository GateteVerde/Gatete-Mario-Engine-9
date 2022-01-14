/// @description Make Mario enter the shoe

//If Mario is visible and it's not holding anything
if (obj_mario.holding == 0)
&& (obj_mario.visible == 1) {
	
	//Play 'Stomp' sound
    audio_play_sound(snd_stomp, 0, false);

    //Snap into position
    obj_mario.x = x;
    obj_mario.y = y-2;
    
    //Force him to hold it
    obj_mario.holding = 4;
    
    //Remember the correct shoe
    switch (sprite_index) {
     
        //Kuribo Shoe
        case (spr_shoe_kuribo): global.mountcolour = 0; break;
        
        //Baburu Shoe
        case (spr_shoe_baburu): global.mountcolour = 1; break;
        
        //Dossun Shoe
        case (spr_shoe_dossun): global.mountcolour = 2; break;
        
        //Jugemu Shoe
        case (spr_shoe_jugemu): global.mountcolour = 3; break;
        
        //Pentaro Shoe
        case (spr_shoe_pentaro): global.mountcolour = 4; break;
    }    
    
    //Create shoe
    instance_create_layer(x, y, "Main", obj_kuriboshoe);
    
    //Destroy
    instance_destroy();
}