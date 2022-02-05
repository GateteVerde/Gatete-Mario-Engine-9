/// @description Destroy collision masks

//Top
if (myt != 0)
&& (instance_exists(myt))
	with (myt) instance_destroy();
	
//Bottom
if (myb != 0)
&& (instance_exists(myb))
	with (myb) instance_destroy();