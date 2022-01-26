/// @description Add 1 item of each (Debug key)

for (var i=0; i<27; i++) {
	
	if (global.inventory[i] < 9)
		global.inventory[i]++;
}