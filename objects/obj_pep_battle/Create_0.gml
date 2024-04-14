ground = 1; //if he is on the ground
z = 0; //his height
/*
moveto is a variable for peppino's moves.
0 is to his regular stance (start position)
1 is his jump
2 is his hammer
3 is his hand move
4 is vacant for a solo move
5 is Bros Attack
    5.1 is Green Shell
    5.2 is Fire Flower
6 is taking out an item
7 is tossing an item in the air
8 is eating the item
9 is healing from the item
10 is tossing an item to Player2
*/
moveto = 0;
hurt = 0;

jump = 0;
roomin = 0;

zspeed = 0; //Speed he drops
zgravity = -1; //Added to the zspeed every step
zgravityon = 0; //If zgravity will affect it
stancex = x;
stancey = y;
image_speed = .35;
stance = 1; //Stance that peppino takes
control = 1; //If peppino can move
battleblock = 0; //What battle block is above peppino's head
if instance_exists(obj_battlestart)
    phase = 0; 
else
    phase = 1;
/* Phase of attacking
1 is choose type
2 is choose move
3 is choose enemy/brother
4 is the attack
5 is consuming an item
0 is standby while it is Player2's turn
    0.15 is standby after Player2 falls in battle
    0.25 is standby during buffer period
    0.5 is standby during display of total damage
    0.75 is standy during fanfare
-1 is being attacked (jump defense)
-2 is being attacked (hammer defense)
-3 is running away
-4 is starting the battle
*/
offset = 0;
length = 5;
move = 0;

itemlist = ds_list_create();
itemamount = ds_list_create();

movechoose = 1; //Move that is chosen
itemdifmax = 0; //Amount of different items that exist, it will be set each step
brositemdifmax = 0; //Amount of different bros attacks are available
itemid = 0; //Item that is being chosen
itemnum = 0; //Item position
brositemnum = 0 //Bros Attack position
itemname = ""; //Item name
fed = 0; //If an item has been consumed
solonum = 1; //Number of solo attacks
brosnum = 1; //Number of bros attacks
runnum = 2; //Number of run commands
jumpchoosewait = 5; //Used in jumping to hit the block
jumpchoosego = 0; //If jumpchoosewait will count down
jumpingchoose = 0; //If you are jumping to choose a block
targetchoose = 1; //The brother/enemy that is chosen
targetchoosego = 0;
targetidaboutto = 0;
jumpdodgewait = 5; //Used in jumping to dodge
jumpdodgego = 0; //If jumpdodgewait will count down
jumpingdodge = 0; //If jumping to dodge
hammerdodgewait = 0; //Used in hammering to dodge
hammerdodgego = 0; //If hammerdodgewait will count down
hammeringdodge = 0; //If dodging with hammer
hammering = 0; //If ready to use hammer
page = 1;
pagenext = 1;
turnnext = 0;
win = 0; //If he won
rankbattle = 0;
pointsbattle = 0;
attacknum = 0;
held = 0; //If holding button
repeataction = 0; //If going for a double timed hit
damage = 0; //Damage dealt
name = "Peppino";
ID = 0;
reaction = 0;

///Particle Test
system=part_system_create();
part_system_depth(system,-100);

part=part_type_create();
part_type_shape(part,pt_shape_star);
part_type_speed(part,5,10,.1,0);
part_type_colour1(part,c_white);
part_type_life(part,10,10);
part_type_size(part,.1,.4,-.02,0);