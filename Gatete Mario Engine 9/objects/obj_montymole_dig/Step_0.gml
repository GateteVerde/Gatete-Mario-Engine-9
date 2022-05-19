/// @description Start digging if Mario is nearby

//If Mario does exists
if (instance_exists(obj_mario)) {

    //If the object is not visible and Mario is nearby
    if (!visible)
    && (obj_mario.x > x-96)
    && (obj_mario.x < x+96) {
    
        //Make it visible
        visible = 1;
        
        //Make a monty appear out of the hole
        alarm[0] = 80;
    }
}
