/// @description Gatete Mario Engine 9 Game Coordinator (This is required for the game to run, do not remove it.)

//Set game caption (Always between brackets)
#macro WINDOW_CAPTION	"Gatete Mario Engine 9"
#macro GAME_VERSION		"1.2.1"
window_set_caption(WINDOW_CAPTION);

//Initialize global variables
init_globals();

//Initialize Player sprites
index_powerups();

//Initialize shader variables
init_shockwave();

//Gameplay variables
#region

	//Gameplay Macros (Edit this when releasing your game)
	#macro LEVEL_AMOUNT	   10 //Number of levels this game have, this variable is used for the star coins
	#macro EXITS_AMOUNT	   23 //Number of exits this game have		
	#macro STARS_AMOUNT		0 //Number of power stars this game have
	
	//Game speed
	#macro GAME_SPEED      60 //Speed the game will run at

	//Don't round off the sub-pixels (applies to uses of screen_round/screen_floor/screen_ceil, NOT values using the built in GMS rounding)
	//false:	Integer rounding similar to GBA/SNES
	//true:		Smoother sub-pixel float movement
	global.subpixels = true;
	
	//Health (If enabled, Mario will be able to take multiple hits to die and cannot turn into small mario)
	global.hp_mode = 0;
	
	//HP / Maximum Health (Sets the maximum hitpoints for Mario if health mode is active)
	global.hp = 4;
	global.hp_max = 4;
	
	//Luigi's Fireball motion (If enabled, Luigi's fireballs will move in a straight line instead of bouncing)
	//false: Disabled
	//true: Enabled
	global.fireballtype = 1;
	
	//Resets combo when getting a 1-UP (Default: false)
	//false: Disabled
	//true: Enabled
	global.combo_reset = false;

	//Turn enemies into coins when hit with a fireball (Default: false)
	//false: Disabled
	//true: Enabled
	global.enemy_to_coin = false;
	
	//Makes Mario able or not able to perform his 3D moves (Default: true)
	//false: Disabled
	//true: Enabled
	global.special_moves = true;

	//Makes Mario bounce on white note blocks from any side (Default: false)
	global.noteblock_all_sides = false;

	//Flight time (In seconds, how much time allow Mario to fly as Raccoon/Tanooki Mario)
	global.flighttime = 4;

	//Climb time (In seconds, how much time allow Mario to climb walls as Cat Mario)
	global.cattime = 3;

	//Maximum amount of hearts (Overridden if health mode is activated)
	global.safeguard_max = 3;

	//Allow reserve of items if enabled (Default: true)
	//false: Disabled
	//true: Enabled
	global.reserve_activated = true;

	//Play P-meter sound?
	global.pmeter_sound = true;

	//How long it takes for Mario's P-meter to fill up
	global.pmeter_limit = 144;

#endregion

//Player Physics
#region

	#region PHYSICS

		//Mario's Physics
		global.physics[0] = 
		{				
			phy_xspeed_min		: 1.3, //Walk Speed
			phy_xspeed_max		: 2.6, //Run Speed
			phy_xspeed_full		: 3.3, //Run Speed (P-Meter)		
			phy_jump			: 3.4675, //Jump 
			phy_jump_spin		: 3.23775, //Jump (Spin)		
			phy_jump_carrot		: 4.1675, //Jump (Carrot)
			phy_jump_frog		: 3.7675, //Jump (Frog)
			phy_jump_squat		: 3.9675, //Jump (Squat Jump)
			phy_jump_tiny		: 2.7375, //Jump (Tiny)		
			phy_accel			: 0.06, //Acceleration
			phy_accel_turn		: 0.15, //Acceleration (Turning)
			phy_decel			: 0.0375, //Deceleration
			phy_grav			: 0.3625, //Gravity
			phy_grav_alt		: 0.0625 //Gravity (Jump)
		};
	
		//Luigi's Physics
		global.physics[1] = 
		{				
			phy_xspeed_min		: 1.18, //Walk Speed
			phy_xspeed_max		: 2.36, //Run Speed
			phy_xspeed_full		: 3, //Run Speed (P-Meter)		
			phy_jump			: 3.53685, //Jump 
			phy_jump_spin		: 3.302505, //Jump (Spin)		
			phy_jump_carrot		: 4.25085, //Jump (Carrot)
			phy_jump_frog		: 3.84285, //Jump (Frog)
			phy_jump_squat		: 4.04685, //Jump (Squat Jump)
			phy_jump_tiny		: 2.79225, //Jump (Tiny)		
			phy_accel			: 0.054, //Acceleration
			phy_accel_turn		: 0.136, //Acceleration (Turning)
			phy_decel			: 0.034, //Deceleration
			phy_grav			: 0.3625, //Gravity
			phy_grav_alt		: 0.0625 //Gravity (Jump)
		};
		
	#endregion
	
	#region PALETTES
	
		//Mario
		global.palette[0] = {
			
			main : spr_palette_mario,
			mega : spr_palette_mario_mega,
			star : spr_palette_mario_starman
		};
		
		//Luigi
		global.palette[1] = {
		
			main : spr_palette_luigi,
			mega : spr_palette_luigi_mega,
			star : spr_palette_luigi_starman
		};
			
	#endregion
#endregion

//Powerup Macros
#region

	#macro cs_small	0
	#macro cs_big 1
	#macro cs_fire 2
	#macro cs_ice 3
	#macro cs_carrot 4
	#macro cs_raccoon 5
	#macro cs_cape 6
	#macro cs_frog 7
	#macro cs_tanooki 8
	#macro cs_hammer 9
	#macro cs_boomerang	10
	#macro cs_superball 11
	#macro cs_bomb 12
	#macro cs_shell	13
	#macro cs_bee 14
	#macro cs_volt 15
	#macro cs_penguin 16
	#macro cs_propeller 17
	#macro cs_bell 18
	#macro cs_football 19
	#macro cs_ranger 20
	#macro cs_squirrel 21
	#macro cs_fraccoon 22
	#macro cs_iraccoon 23
	#macro cs_beet 24
	#macro cs_lui 25
	#macro cs_wind 26
	#macro cs_bubble 27
	#macro cs_tiny (cs_bubble + 1)
	#macro cs_gold (cs_bubble + 2)
	#macro cs_starman (cs_bubble + 3)
	#macro cs_pwing (cs_bubble + 4)
	#macro cs_mega (cs_bubble + 5)

#endregion

//Item Macros
#region

	#macro cs_snake -30
	#macro cs_balloon -29
	#macro cs_beanstalk_side -28
	#macro cs_beanstalk -27
	#macro cs_billy -26
	#macro cs_powblock -25
	#macro cs_propellerblock -24
	#macro cs_trampoline -23
	#macro cs_key -22
	#macro cs_gswitch -21
	#macro cs_pswitch -20
	#macro cs_rotten -19
	#macro cs_poison -18
	#macro cs_heart -17
	#macro cs_3up -16
	#macro cs_1up -15
	#macro cs_pballoon -14
	#macro cs_shoe_pentaro -13
	#macro cs_shoe_jugemu -12
	#macro cs_shoe_dossun -11
	#macro cs_shoe_baburu -10
	#macro cs_shoe_kuribo -9
	#macro cs_yoshi_p -8
	#macro cs_yoshi_t -7
	#macro cs_yoshi_b -6
	#macro cs_yoshi_y -5
	#macro cs_yoshi_r -4
	#macro cs_yoshi_g -3
	#macro cs_coin_s -2
	#macro cs_coin -1
	
#endregion

//Key Enums
#region

	enum input {
	
		//Directions
		up,
		down,
		left,
		right,
		
		//A Key
		action_0,
		
		//B Key
		action_1,
		
		//X Key
		action_2,
		
		//Start / Select
		start,
		select
	}
	
#endregion

//World Map Enums
#region

	enum mapstate {

	    preidle,
	    idle,
	    wait,
	    walk
	}
#endregion

//Screenshot number
num = 0;

//Progress (Used to calculate how much you progressed in-game)
got = 0;
total = 0;

//Current pitch
pitch = 1;
voice_pitch = 1;

//Lives
addlives = 0;

//Remember last room
last_room = noone;

//Current File
global.file = 0;

//Game Width
global.gw = room_width;

//Game Height
global.gh = room_height;

//Checks if the game was restarted
global.restart = false;

//This is to make sure that the bars are not misplaced in title and credits room (If you set the game size other than the default one)
room_set_width(rm_title, global.gw);
room_set_height(rm_title, global.gh);

//Data structure for picked up 3up moons
global.moons = ds_map_create();

//Font Variables
global.gui_font	= font_add_sprite(spr_gui_font, ord("!"), 0, 0);
global.gui_font_menu = font_add_sprite(spr_gui_font_menu, ord("!"), 0, 0);
global.gui_font_numbers	= font_add_sprite_ext(spr_gui_font_numbers, "0123456789-+*", 0, 0);
global.gui_font_numbers_gold = font_add_sprite_ext(spr_gui_font_numbers_gold, "0123456789-+*", 0, 0);
global.gui_font_numbers_large = font_add_sprite_ext(spr_gui_font_numbers_large, "0123456789-", 0, 0);
global.gui_font_numbers_large_gold = font_add_sprite_ext(spr_gui_font_numbers_large_gold, "0123456789-", 0, 0);

//Disable application surface automatic drawing
application_surface_draw_enable(false);

//Enables Borderless Fullscreen
window_enable_borderless_fullscreen(true);

//Set up epsilon for floating point numbers
math_set_epsilon(0.00001);