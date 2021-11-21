/// @description Destroy after fading out completely

//Fade out
alpha -= 0.04;

//Destroy the object
if (alpha < 0)
    instance_destroy();