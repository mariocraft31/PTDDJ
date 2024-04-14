//Move Lakitu cloud in
if global.turn = -1.25 && obj_pep_battle.x > 107 && stacheamount = -1
{
   // if !audio_is_playing(snd_movein)
    //    audio_play_sound(snd_movein,0,0);
    with obj_pep_battle image_index = 0;
    with obj_pep_battle stance = 12;
    with obj_pep_battle x -= 4;
    instance_create(432,24,obj_levelupbonus);
}
if global.turn = -1.75 && obj_gustavob.x > 105 && stacheamount = -1
{
    //if !audio_is_playing(snd_movein)
    //    audio_play_sound(snd_movein,0,0);
    with obj_gustavob image_index = 0;
    with obj_gustavob stance = 12;
    with obj_gustavob x -= 1;
    instance_create(432,24,obj_levelupbonus);
}
if stacheamount >= 0
{
    if hpamount = 0
        hpamount = -1;
    else if bpamount = 0
        bpamount = -1;
    else if powamount = 0
        powamount = -1;
    else if defamount = 0
        defamount = -1;
    else if spdamount = 0
        spdamount = -1;
    else if stacheamount = 0
        stacheamount = -1;
    alarm[8] = 8;
}

