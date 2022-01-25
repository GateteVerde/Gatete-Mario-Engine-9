/// @description Add one item to the inventory

//If inventory is not opened
if (inventory == 0) {

	if (global.inventory[0] < 30) {

		global.inventory[0]++;
	}
	global.inventory[global.inventory[0]] = cs_starman;
}