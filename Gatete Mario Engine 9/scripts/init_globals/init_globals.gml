/// @function init_globals();

function init_globals() {
	
	//Music Variables
	global.levelmusic = snd_gameover;
	
	//Stream played in room
	global.stream = noone;
	
	//Stream played in map
	global.mapstream = noone;

	//Current minigame
	global.minigame = 1;
	
	//Current player
	global.player = 0;
	
	//World
	global.world = 1;

	//Level Time
	global.timer = 0;

	//Lives
	lives = 5;

	//Score
	score = 0;

	//Coins
	global.coins = 0;

	//Red Coins
	global.coins_red = 0;

	//Silver Coins
	global.coins_silver = 0;
	
	//Handles coin collection mode
	global.coins_left = 0;
	global.collect_mode = 0;

	//Display 'Mario Start!' text
	global.mariostart = 0;

	//Checks whether a level is cleared
	//0: No clear
	//1: Clear
	//2: Clear (Secret Exit)
	//3: Clear (Exit from side)
	global.clear = 0;

	//SMB3 Card System
	global.card[0] = -1;
	global.card[1] = -1;
	global.card[2] = -1;
	
	//Prefreeze
	global.prefreeze = noone;

	//P-Wing
	global.pwing = 0;

	//Berries
	global.berries = 0;

	//Cherries
	global.cherries = 0;

	//Powerup
	global.powerup = cs_small;

	//Reserve item
	global.reserve = cs_small;

	//Safeguard
	global.safeguard = 0;

	//Checkpoint
	global.checkpoint = noone;

	//Checkpoint Room
	global.checkpointroom = noone;
	
	//Level Beaten?
	global.levelbeat = 0;

	//Fireworks
	global.fireworks = 0;

	//Switch Palaces
	global.palace_y = 0;
	global.palace_g = 0;
	global.palace_r = 0;
	global.palace_b = 0;

	//ON / OFF Block
	global.on_off_block = 0;

	//Position change object type
	//-1: No Change
	//0: Mario
	//1: Pipe
	//2: Jump
	//3: Climb
	global.postchange = -1;
	
	//Wakes all enemies
	global.whistle = 0;

	//Mount
	//0: No mount
	//1: Yoshi
	//2: Kuribo Shoe
	global.mount = 0;

	//Mount colour
	//0: Green
	//1: Red
	//2: Yellow
	//3: Blue
	//4: Teal
	//5: Pink (Does not affect Kuribo shoes, only Yoshi)
	global.mountcolour = 0;

	//P-Switch time limit
	global.pswitch = 0;

	//G-Switch time limit
	global.gswitch = 0;

	//Starman time limit
	global.starman = 0;

	//Star used in map?
	global.mapstar = 0;

	//Mushroom house prizes
	global.prize[0] = 0;
	global.prize[1] = 0;
	global.prize[2] = 0;

	//Map pipe area type
	global.pipetype = 0;
	global.pipex = 0;
	global.pipey = 0;
	
	//Did Mario died?
	global.died = 0;
	
	//Did the shmup tutorial fired?
	global.first_shmup_time = 0;

	//Data structure for opened doors
	global.doors = ds_map_create();

	//Data structure for collected ace coins (Resets when end_level is called)
	global.acecoins = ds_map_create();

	//Data structure for collected red coin rings (Resets when end_level is called)
	global.redrings = ds_map_create();
	
	//Data structure for collected power stars
	global.powerstars = ds_map_create();

	//Item that is being carried between rooms
	global.carrieditem = noone;

	//The sprite used by an item carried between rooms
	global.carriedsprite = noone;
	
	//The frame used by an item carried between rooms
	global.carriedframe = 0;

	//The object to return when carrying a SMB2 enemy between rooms
	global.turnback = 0;
	
	//Global combo
	global.hitcombo = 0;

	//Initialize star coin system (Replace '999' with the amount of levels your game will have)
	//0: Not collected
	//1: Collected, not saved
	//2: Collected, saved with checkpoint
	//3: Collected, saved with level completion. (Adds to global.starcoins)
	var level_amount = LEVEL_AMOUNT;
	for (var i = 0; i < 3; i++) {

	    global.sc[i] = ds_map_create();
	    for (var j = 0; j <= level_amount; j++)
	        ds_map_add(global.sc[i], j, 0);
	}
	
	//Current level
	global.level = -1;

	//Star Coins collected
	global.starcoins = 0;

	//Handle the data structure of the levels completed on the map and allows exit from them
	global.beaten = 0;
	global.worldmap_beaten = ds_map_create();

	//Handle the data structure of the world map.
	global.worldmap = ds_map_create();
	
	//Handle the data structure of the card minigame.
	global.cardgame = ds_map_create();

	//Handle the pattern for the cards of the card minigame.
	global.cardpattern = 1;

	//Levels beaten
	global.cleared_levels = 0;
	
	//Star House
	for (var i=1; i<=8; i++) {
	
		global.star_house[i] = 0;
	}
	
	//Map inventory variables
	for (var i=0; i<15; i++) {
	
		global.inventory[i] = 0;
	}
	
	//100% game completion variable
	global.gameclear = 0;
}