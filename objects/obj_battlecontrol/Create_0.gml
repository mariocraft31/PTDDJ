//Battle Control:
//global.turn is who's turn it is. 0 is Mario, 1 is gustavo, and 2 is the enemy group's turn.

//Sets up what you are fighting
//You may program up to 5 enemys for each battle
//Set unused ids as 0
//Initialize variables
image_speed = 0.275;
wintype = -1;
expleft = 0;
hpamount = 0;
bpamount = 0;
powamount = 0;
defamount = 0;
spdamount = 0;
stacheamount = 0;
spd = 0;
locked = 0;
padvisibility = 0;
_alpha = 0.8;


//Place players
broid[0] = 0;
if global.solo = 0
{
    broid[1] = instance_create(80,136,obj_pep_battle);
    broid[2] = instance_create(64,200,obj_gustavob);
}
else if global.solo = 1
{
    broid[1] = instance_create(72,168,obj_pep_battle);
    broid[2] = 0;
}
else if global.solo = 2
{
    broid[1] = 0;
    broid[2] = instance_create(72,168,obj_gustavob);
}
broid[3] = 0;

//Battle Types
scr_battlelist();

