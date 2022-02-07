/// @description Set alpha if outside view

//If the card is collected
if (ready == 1) {

	image_alpha -= 0.05;
	if (image_alpha < 0)
		image_alpha = 0;
}