//Find enemy's speed
var i = 0;
repeat(5)
{
    if instance_exists(enemyid[i]) or (enemyid[i] = 0) or (enemyid[i] = noone)
    or obj_pep_battle.phase < 0 or obj_gustavob.phase < 0
        {}
    else
        spd = enemyid[i].spd;
    i += 1;
}

//Determine who goes first
if global.Pspd < spd or global.Gspd < spd
{
    if global.Pspd > global.Gspd or !instance_exists(obj_gustavob)
        obj_pep_battle.turnnext = 1;
    else if global.Gspd > global.Pspd or !instance_exists(obj_pep_battle)
        obj_gustavob.turnnext = 1;
    global.turn = 2;
    global.strike = 0;
}
else if global.Gspd > global.Pspd or !instance_exists(obj_pep_battle)
{
    obj_gustavob.phase = 1;
    obj_gustavob.turnnext = 0;
    obj_pep_battle.turnnext = 1;
    global.turn = 1;
    global.strike = 0;
}
else
{
    obj_pep_battle.phase = 1;
    obj_pep_battle.turnnext = 0;
    obj_gustavob.turnnext = 1;
    global.turn = 0;
    global.strike = 0;
}

