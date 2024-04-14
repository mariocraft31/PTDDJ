//Win
if global.Pdead = 0 && instance_exists(obj_pep_battle)
{
    if wintype = -1
        with obj_pep_battle stance = 8;
    if wintype = -2
        with obj_pep_battle stance = 9;
    if wintype = -3
        with obj_pep_battle stance = 10;
}
if global.Gdead = 0 && instance_exists(obj_gustavob)
{
    if wintype = -1
        with obj_gustavob stance = 8;
    if wintype = -2
        with obj_gustavob stance = 9;
    if wintype = -3
        with obj_gustavob stance = 10;
}

//Add up points
if global.experience > 0
{
    //audio_play_sound(snd_spendcoins,0,0);
    if global.experience > 0
    {
        if global.Pdead = 0 && instance_exists(obj_pep_battle)
        {
            global.Pexp += 1; //Add to Mario's exp
            global.Pexpleft -= 1; //Subtract amount Mario has left to level up
        }
        if global.Gdead = 0 && instance_exists(obj_gustavob)
        {
            global.Gexp += 1; //Added to gustavo's exp
            global.Gexpleft -= 1; //Subtract amount Mario has left to level up
        }
        global.experience -= 1; //Subtract 1 from exp gained
        alarm[3] = 1;
    }
}
if global.coinsearned > 0
{
    //if !audio_is_playing(snd_spendcoins)
    //    audio_play_sound(snd_spendcoins,0,0);
    global.coins += 1; //Add to coin count
    global.coinsearned -= 1; //Subtract 1 from coins gained
    if global.coinsearned > 0
        alarm[3] = 1;
}
//if global.experience = 0 && global.coinsearned = 0
//    audio_stop_sound(snd_spendcoins);