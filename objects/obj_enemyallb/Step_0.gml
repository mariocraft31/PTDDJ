enemynum = 0; //the number in obj_battlecontrol's variable enemyid

if id = obj_battlecontrol && enemyid[1]
    enemynum = 1;
if id = obj_battlecontrol && enemyid[2]
    enemynum = 2;
if id = obj_battlecontrol && enemyid[3]
    enemynum = 3;
if id = obj_battlecontrol && enemyid[4]
    enemynum = 4;
if id = obj_battlecontrol && enemyid[5]
    enemynum = 5;

if global.Pdead = 1 && global.Gdead = 1 or dead = 1
    exit;
else
{
    if x = stancex && y = stancey
    {
        if global.Pdead = 0.5 && obj_pep_battle.sprite_index = spr_mariodie
            exit;
        if global.Gdead = 0.5 && obj_gustavob.sprite_index = spr_gustavodie
            exit;
        if global.Pdead = 1 && global.Gdead = 1
            exit;
    }
    if hurt = 1
        hurttime += -0.2;
    if stance = 1
        sprite_index = spr_forknight_idle;
    if hurttime <= 0
    {
        hurt = 0;
        hurttime = 10;
    }
    if hurt = 1
        sprite_index = spr_forknight_stun;
    if hurt = 0
        sprite_index = spr_forknight_idle;
    
    if x = stancex && y = stancey
        stance = 1;
    if moveto = 0
        mp_linear_step(stancex,stancey,5,0); //Return to starting position
    if moveto = 1
    {
        mp_linear_step(obj_pep_battle.x+32,obj_pep_battle.y,2,0); //Attack Mario
        sprite_index = spr_forknight_walk;
		stance = 0;
        obj_pep_battle.stance = 3; //Battle stance
        obj_gustavob.stance = 3; //Battle stance
    }
    if x = obj_pep_battle.x+32 && y = obj_pep_battle.y && moveto = 1
        moveto = 2;
    if moveto = 2
    {
        mp_linear_step(obj_pep_battle.x,obj_pep_battle.y,2,0); //Attack Mario
        sprite_index = spr_forknight_walk;
		stance = 0;
        obj_pep_battle.stance = 3; //Battle stance
        obj_gustavob.stance = 3; //Battle stance
    }
    if x = obj_pep_battle.x && y = obj_pep_battle.y && moveto = 2
    {
        moveto = 0;
        turndone = 1
    }
    
    if moveto = 3
    {
        mp_linear_step(obj_gustavob.x+32,obj_gustavob.y,2,0); //Attack gustavo
        sprite_index = spr_forknight_walk;
		stance = 0;
        obj_pep_battle.stance = 3; //Battle stance
        obj_gustavob.stance = 3; //Battle stance
    }
    if x = obj_gustavob.x+32 && y = obj_gustavob.y && moveto = 3
        moveto = 4;
    if moveto = 4
    {
        mp_linear_step(obj_gustavob.x,obj_gustavob.y,1,0); //Attack gustavo
        sprite_index =  spr_forknight_walk;
		stance = 0;
        obj_pep_battle.stance = 3; //Battle stance
        obj_gustavob.stance = 3; //Battle stance
    }
    if x = obj_gustavob.x && y = obj_gustavob.y && moveto = 4
    {
        moveto = 0;
        turndone = 1;
    }
    
    enemyahead = 0; //enemyahead is just a variable used in coding, don't worry about it
    if turndone = 1 && global.turn = 2
    {
        if enemynum < 5
        {
            do 
            {
                enemyahead += 1;
                nextid = obj_battlecontrol.enemyid[enemynum+enemyahead];
            }
            until (instance_exists(nextid) or enemynum+enemyahead = 5)
            if instance_exists(nextid)
            {
                if nextid.moveto = 0 && nextid.turndone = 0
                {
                    target = floor(random(2)); //Choose whether to attack Mario or gustavo
                    if global.Pdead > 0
                        target = 1;
                    if global.Gdead > 0
                        target = 0;
        
                    if target = 0
                        nextid.moveto = 1; //Move to Mario
                    if target = 1
                        nextid.moveto = 3; //Move to gustavo
                }
            }
        }
        if enemynum+enemyahead = 5 && x = xstart && y = ystart
        {
            if global.Gspd > global.Pspd && global.turn <> 1
            {
                obj_gustavob.turnnext = 0;
                obj_gustavob.phase = 1;
                obj_pep_battle.turnnext = 1;
                obj_pep_battle.stance = 1;
                global.turn = 1;
            }
            else
            {
                obj_pep_battle.turnnext = 0;
                obj_gustavob.turnnext = 1;
                obj_gustavob.stance = 1;
                global.turn = 0;
            }
            turndone = 0;
        }
    }

    if global.turn != 2
        turndone = 0;

    if hp <= 0 //Enemy dies
    {
        global.stunned = true;
        audio_play_sound(snd_enemy_dead,0,0);
        global.experience += experience;
        global.coinsearned += coins;
        event_user(0);
    }
}