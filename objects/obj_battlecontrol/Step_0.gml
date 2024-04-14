if keyboard_check_pressed(global.keyA) //A
{
    if global.turn < 0 && obj_pep_battle.stance <> 7 && obj_gustavob.stance <> 7
    {
        if global.turn = -1.25 && obj_pep_battle.x > 107 && locked = 0 && !instance_exists(obj_levelupbonus)
        {
            //audio_play_sound(snd_spendcoins,0,0);
            //audio_play_sound(snd_confirm,0,0);
            //Add up stat totals
            global.maxPHP += hpamount;
            hpamount = 0;
            global.maxPBP += bpamount;
            bpamount = 0;
            global.Ppow += powamount;
            powamount = 0;
            global.Pdef += defamount;
            defamount = 0;
            global.Pspd += spdamount;
            spdamount = 0;
            global.Pstache += stacheamount;
            stacheamount = 0;
            locked = 1;
            alarm[8] = 50; //Move Lakitu cloud in
        }
        else if global.turn = -1.75 && obj_gustavob.x > 105 && locked = 0 && !instance_exists(obj_levelupbonus)
        {
            //audio_play_sound(snd_spendcoins,0,0);
            //audio_play_sound(snd_confirm,0,0);
            //Add up stat totals
            global.maxGHP += hpamount;
            hpamount = 0;
            global.maxGBP += bpamount;
            bpamount = 0;
            global.Gpow += powamount;
            powamount = 0;
            global.Gdef += defamount;
            defamount = 0;
            global.Gspd += spdamount;
            spdamount = 0;
            global.Gstache += stacheamount;
            stacheamount = 0;
            locked = 1;
            alarm[8] = 50; //Move Lakitu cloud in
        }
        else if instance_exists(obj_levelupbonus) && obj_levelupbonus.moveto = 0
        {
            //Start bonus wheel
            //audio_play_sound(snd_confirm,0,0);
            //audio_play_sound(snd_roulette,0,1);
            obj_levelupbonus.moveto = 2;
            with obj_levelupbonus alarm[0] = 5;
        }
        else if global.experience = 0 && global.coinsearned = 0
        {
            //Check to see if Mario or gustavo leveled up
            event_user(4);
        }
        else if global.experience > 0 or global.coins > 0
        {
            //Add up remaining totals at once
            //audio_stop_sound(snd_spendcoins);
            //audio_play_sound(snd_confirm,0,0);
            if global.Pdead = 0
            {
                global.Pexp += global.experience;
                global.Pexpleft -= global.experience;
            }
            if global.Gdead = 0
            {
                global.Gexp += global.experience;
                global.Gexpleft -= global.experience;
            }
            global.coins += global.coinsearned;
            global.experience = 0;
            global.coinsearned = 0;
        }
    }
}
if keyboard_check_pressed(global.keyB) //B
{
    if instance_exists(obj_levelupbonus) && obj_levelupbonus.moveto = 2
    {
        //audio_play_sound(snd_cancel,0,0);
        //audio_stop_sound(snd_roulette);
        with obj_levelupbonus moveto = 0;
        with obj_levelupbonus value = 0;
    }
}

if !instance_exists(enemyid[1]) && !instance_exists(enemyid[2]) && !instance_exists(enemyid[3]) && !instance_exists(enemyid[4])&& !instance_exists(enemyid[5])
{
    if obj_pep_battle.x = obj_pep_battle.stancex && obj_pep_battle.y = obj_pep_battle.stancey
    && obj_gustavob.x = obj_gustavob.stancex && obj_gustavob.y = obj_gustavob.stancey
    && !instance_exists(obj_pointsbattle) && !instance_exists(obj_rankbattle)
    && !instance_exists(obj_totaldamage) && (global.posx = 0 && global.posy = 0
    or global.turn = 2)
        event_user(3); //Victory
}
else if global.turn = 2 //Enemies Turn
{
    startid = 0;
    do
    {
        startid += 1;
    }
    until (instance_exists(enemyid[startid]));
    
    if instance_exists(enemyid[startid])
    {
        if enemyid[startid].turndone = 0 && enemyid[startid].moveto = 0
        {
            if obj_pep_battle.hurt = 1 && obj_pep_battle.control = 1 && global.Pdead = 0 && instance_exists(obj_pep_battle)
                obj_pep_battle.hurt = 0;
            if obj_gustavob.hurt = 1 && obj_gustavob.control = 1 && global.Gdead = 0 && instance_exists(obj_gustavob)
                obj_gustavob.hurt = 0;
            target = floor(random(2));
            if global.Pdead > 0 or !instance_exists(obj_pep_battle)
                target = 1;
            if global.Gdead > 0 or !instance_exists(obj_gustavob)
                target = 0;
            if target = 0
                enemyid[startid].moveto = 1; //Move towards Mario
            if target = 1
                enemyid[startid].moveto = 3; //Move towards gustavo
        }
    }
}

if instance_number(obj_pep_battle) = 0 and instance_number(obj_gustavob) = 0
{
    global.stunned = true; //This could be the variable to avoid encountering same enemy in Overworld
    transition_kind = 21;
    room_goto(global.roomin);
	with (obj_ow_player)
		active = true
}