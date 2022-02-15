/// @description It's a me, Mario!

//Stay always in front
depth = -5;

//Is Mario frozen?
freeze = 0;

//Enable / disable gravity
enable_gravity = true;

//Enable / disable control
enable_control = true;

//Enable / disable invincibility
//0: Disabled
//1: Enabled
//-1: Phase through
invulnerable = 0;

//Custom movement 
xspeed = 0;
yspeed = 0;
xadd = 0;
yadd = 0;
save_ims = 0;
save_xsp = 0;
save_ysp = 0;
save_grav = 0;

//Check if inair
inair = 0;
inairtime = 0;

//Handle Mario's current state
//0: Idle
//1: Walk
//2: Jump
//3: Climb
enum playerstate {
	
	idle = 0,
	walk = 1,
	jump = 2,
	climb = 3	
}
state = playerstate.idle;
statedelay = 0;

//Handle Mario's horizontal scale
//1: Right
//-1: Left
xscale = 1;

//Handle Mario's vertical scale
//1: Normal
//-1: Ceiling
yscale = 1;

//Handle Mario's direction when stuck in a wall
//1: Right
//-1: Left
direct = 1;
direct2 = 0;

//Allows the player to grab a beanstalk
canhang = 0;

//Allows the player to turn around when climbing a beanstalk
canturn = 0;

//Handle Mario's holding state
//0: No holding
//1: Front (SMB3 / SMW)
//2: Overhead (SMB2)
//3: Boomerang (SMA4)
//4: On Yoshi / Kuribo Shoe
holding = 0;

//Handle Mario's jumping state
//0: Can jump
//1: Variable jump
//2: No variable jump
jumping = 0;

//Handle Mario's jumping type
//0: Normal jump
//1: Spin Jump
jumpstyle = 0;

//Handle Mario's triple jump
triplejump = 0;
tjtime = 0;

//Handle Mario's climbing type
//0: Normal
//1: Side (SMB1)
climbstyle = 0;

//Checks for slippery surfaces
isslip = 0;

//Checks if Mario is under the effects of a mega mushroom
ismega = 0;

//Plays a sound when Mario is climbing or swimming with the frog suit
noisy = 0;
noise = 0;

//Makes Mario run slightly faster (P-Meter)
run = 0;

//Run cooldown
run_cooldown = 0;

//Makes Mario perform a slide animation or turn when holding something
turning = 0;

//Makes Mario able to swim
swimming = 0;

//Makes Mario able to butt-slide slopes
sliding = 0;

//Is Mario running?
run = false;

//Makes Mario able to fly
flyfix = 0;
flying = 0;

// Cape variables
cape = noone;
fly = noone;
memory_yspeed = 0;

// Spinner
spin = noone;

//Makes Mario able to crouch down
crouch = 0;

//Makes Mario hit a climbable net
netsmack = 0;

//Makes Mario able or not able to move
move = 1;

//Handle P-Meter
pmeter = 0;

//Makes Mario do a special animation when kicking / throwing items
kicking = 0;

//Checks if Mario is stuck on a solid surface.
inwall = false;

//Makes Mario do a special animation when shooting a projectile
firing = 0;

//Makes Mario do a special animation when flying with the raccoon / tanooki powerup
wiggle = 0;

//Sets direction of projectiles when doing a spin jump
dir = 1;

//Makes Mario able to jump in walls
wallkick = 0;
wallready = 0;

//Carrot / Bee powerup flight variables
beefly = 0;
floatnow = 0;
isfloating = 0;

//Frog / Penguin powerup swimming variables
swimtype = 0;

//Squirrel powerup
squirreltime = 120;
squirrelpropel = 0;

//Somersault
somersault = 0;

//Groundpound
groundpound = 0;

//Prevents the player from moving if stunned
stuntime = 0;

//Prevents the player from moving if frozen
freezetime = 0;

//Makes the player shake when stunned
shake = 0;

//Player colour
isflashing = 0;

//Disables grav when floating with raccoon or tanooki powerup
disablegrav = 0;

//How many consecutive stomps has Mario made
hitcombo = 0;

//If the player is warping from a pit.
pitwarp = false;

//Angle
angle = 0;

//Timers
_timer = 0;
event_user(9);

//Swim top
swim_y = 0;

//Effects
alarm[1] = 1;
alarm[2] = 1;
alarm[3] = 1;

//Flags
instance_create_layer(0, 0, "Main", obj_mario_marker_top);
instance_create_layer(0, 0, "Main", obj_mario_marker_bottom);