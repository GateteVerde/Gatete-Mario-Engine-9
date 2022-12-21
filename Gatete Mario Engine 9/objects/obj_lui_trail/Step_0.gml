/// @description Decrement alpha and destroy

alpha -= 0.05;
if (alpha < 0.05)
	instance_destroy();