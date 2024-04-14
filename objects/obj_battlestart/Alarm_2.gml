//Start the battle
if global.strike > 0 && global.strike < 4
{
    //Attack all enemies in the battle
    if obj_battlecontrol.enemyid[0] > 0
    {
        obj_pep_battle.targetx = obj_battlecontrol.enemyid[0].x;
        obj_pep_battle.targety = obj_battlecontrol.enemyid[0].y;
        obj_pep_battle.targetid = obj_battlecontrol.enemyid[0];
    }
    //Otherwise, choose the single enemy in the battle
    else if obj_battlecontrol.enemyid[1] > 0
    {
        obj_pep_battle.targetx = obj_battlecontrol.enemyid[1].x;
        obj_pep_battle.targety = obj_battlecontrol.enemyid[1].y;
        obj_pep_battle.targetid = obj_battlecontrol.enemyid[1];
    }
    else if obj_battlecontrol.enemyid[2] > 0
    {
        obj_pep_battle.targetx = obj_battlecontrol.enemyid[2].x;
        obj_pep_battle.targety = obj_battlecontrol.enemyid[2].y;
        obj_pep_battle.targetid = obj_battlecontrol.enemyid[2];
    }
    else if obj_battlecontrol.enemyid[3] > 0
    {
        obj_pep_battle.targetx = obj_battlecontrol.enemyid[3].x;
        obj_pep_battle.targety = obj_battlecontrol.enemyid[3].y;
        obj_pep_battle.targetid = obj_battlecontrol.enemyid[3];
    }
    else if obj_battlecontrol.enemyid[4] > 0
    {
        obj_pep_battle.targetx = obj_battlecontrol.enemyid[4].x;
        obj_pep_battle.targety = obj_battlecontrol.enemyid[4].y;
        obj_pep_battle.targetid = obj_battlecontrol.enemyid[4];
    }
    else
    {
        obj_pep_battle.targetx = obj_battlecontrol.enemyid[5].x;
        obj_pep_battle.targety = obj_battlecontrol.enemyid[5].y;
        obj_pep_battle.targetid = obj_battlecontrol.enemyid[5];
    }
}
else if global.strike > 4
{
    //Attack all enemies in the battle
    if obj_battlecontrol.enemyid[0] > 0
    {
        obj_gustavob.targetx = obj_battlecontrol.enemyid[0].x;
        obj_gustavob.targety = obj_battlecontrol.enemyid[0].y;
        obj_gustavob.targetid = obj_battlecontrol.enemyid[0];
    }
    //Otherwise, choose the single enemy in the battle
    else if obj_battlecontrol.enemyid[1] > 0
    {
        obj_gustavob.targetx = obj_battlecontrol.enemyid[1].x;
        obj_gustavob.targety = obj_battlecontrol.enemyid[1].y;
        obj_gustavob.targetid = obj_battlecontrol.enemyid[1];
    }
    else if obj_battlecontrol.enemyid[2] > 0
    {
        obj_gustavob.targetx = obj_battlecontrol.enemyid[2].x;
        obj_gustavob.targety = obj_battlecontrol.enemyid[2].y;
        obj_gustavob.targetid = obj_battlecontrol.enemyid[2];
    }
    else if obj_battlecontrol.enemyid[3] > 0
    {
        obj_gustavob.targetx = obj_battlecontrol.enemyid[3].x;
        obj_gustavob.targety = obj_battlecontrol.enemyid[3].y;
        obj_gustavob.targetid = obj_battlecontrol.enemyid[3];
    }
    else if obj_battlecontrol.enemyid[4] > 0
    {
        obj_gustavob.targetx = obj_battlecontrol.enemyid[4].x;
        obj_gustavob.targety = obj_battlecontrol.enemyid[4].y;
        obj_gustavob.targetid = obj_battlecontrol.enemyid[4];
    }
    else
    {
        obj_gustavob.targetx = obj_battlecontrol.enemyid[5].x;
        obj_gustavob.targety = obj_battlecontrol.enemyid[5].y;
        obj_gustavob.targetid = obj_battlecontrol.enemyid[5];
    }
}

//All Strikes
if global.strike = 7 //gustavo Hand 1st Strike
{
    obj_gustavob.alarm[7] = 2;
    obj_gustavob.phase = 0.25;
    obj_gustavob.zspeed = 0;
    obj_gustavob.stance = 0; //stance 0 means that he is not in a stance
    obj_gustavob.control = 0;
    obj_pep_battle.phase = 0;
    global.turn = 1;
}
else if global.strike = 6 //gustavo Hammer 1st Strike
{
    obj_gustavob.alarm[6] = 2;
    obj_gustavob.phase = 0.25;
    obj_gustavob.zspeed = 0;
    obj_gustavob.stance = 0; //stance 0 means that he is not in a stance
    obj_gustavob.control = 0;
    obj_pep_battle.phase = 0;
    global.turn = 1;
}
else if global.strike = 5 //gustavo Jump 1st Strike
{
    obj_gustavob.alarm[5] = 2;
    obj_gustavob.phase = 0.25;
    obj_gustavob.zspeed = 0;
    obj_gustavob.stance = 0; //stance 0 means that he is not in a stance
    obj_gustavob.control = 0;
    obj_pep_battle.phase = 0;
    global.turn = 1;
}
else if global.strike = 4 //Enemy 1st Strike
    global.turn = 2;
else if global.strike = 3 //Mario Hand 1st Strike
{
    obj_pep_battle.alarm[7] = 2;
    obj_pep_battle.phase = 0.25;
    obj_pep_battle.zspeed = 0;
    obj_pep_battle.stance = 0; //stance 0 means that he is not in a stance
    obj_pep_battle.control = 0;
    obj_gustavob.phase = 0;
    global.turn = 0;
}
else if global.strike = 2 //Mario Hammer 1st Strike
{
    obj_pep_battle.alarm[6] = 2;
    obj_pep_battle.phase = 0.25;
    obj_pep_battle.zspeed = 0;
    obj_pep_battle.stance = 0; //stance 0 means that he is not in a stance
    obj_pep_battle.control = 0;
    obj_gustavob.phase = 0;
    global.turn = 0;
}
else if global.strike = 1 //Mario Jump 1st Strike
{
    obj_pep_battle.alarm[5] = 2;
    obj_pep_battle.phase = 0.25;
    obj_pep_battle.zspeed = 0;
    obj_pep_battle.stance = 0; //stance 0 means that he is not in a stance
    obj_pep_battle.control = 0;
    obj_gustavob.phase = 0;
    global.turn = 0;
}
else //Neutral Encounter
    with obj_battlecontrol 
		event_user(8);
//Play Battle Music

if scale > 28
	instance_destroy();