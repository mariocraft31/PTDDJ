//Item Index
itemindex[1,0] = false;
itemindex[1,1] = false;
itemindex[1,2] = false;
itemindex[1,3] = false;
itemindex[1,4] = false;
itemindex[1,5] = false;
itemindex[1,6] = false;
itemindex[1,7] = false;
itemindex[1,8] = false;
itemindex[1,9] = false;
itemindex[1,10] = false;
itemindex[1,11] = false;
itemindex[1,12] = false;
itemindex[1,13] = false;
itemindex[1,14] = false;
itemindex[1,15] = false;
itemindex[1,16] = false;
itemindex[1,17] = false;
itemindex[1,18] = false;
itemindex[1,19] = false;
itemindex[2,0] = false;
itemindex[2,1] = false;
itemindex[2,2] = false;
itemindex[2,3] = false;
itemindex[2,4] = false;
itemindex[2,5] = false;
itemindex[2,6] = false;
itemindex[2,7] = false;
itemindex[2,8] = false;
itemindex[2,9] = false;
itemindex[2,10] = false;
itemindex[2,11] = false;
itemindex[2,12] = false;
itemindex[2,13] = false;
itemindex[2,14] = false;
itemindex[2,15] = false;
itemindex[2,16] = false;
itemindex[2,17] = false;
itemindex[2,18] = false;
itemindex[2,19] = false;
itemindex[3,0] = false;
itemindex[3,1] = false;
itemindex[3,2] = false;
itemindex[3,3] = false;
itemindex[3,4] = false;
itemindex[3,5] = false;
itemindex[3,6] = false;
itemindex[3,7] = false;
itemindex[3,8] = false;
itemindex[3,9] = false;
itemindex[3,10] = false;
itemindex[3,11] = false;
itemindex[3,12] = false;
itemindex[3,13] = false;
itemindex[3,14] = false;
itemindex[3,15] = false;
itemindex[3,16] = false;
itemindex[3,17] = false;
itemindex[3,18] = false;
itemindex[3,19] = false;

//Select and use item
if global.Gdead > 0 && itemid = 13 && global.oneups > 0
{
    targetchoose = 2;
    phase = 3;
    //audio_play_sound(snd_confirm,0,0);
}
else if global.Gdead > 0 && itemid = 14 && global.oneupsupers > 0
{
    targetchoose = 2;
    phase = 3;
    //audio_play_sound(snd_confirm,0,0);
}
/*else if global.Gdead = 0 && itemid = 13 && global.oneups > 0
    audio_play_sound(snd_incorrect,0,0);
else if global.Gdead = 0 && itemid = 14 && global.oneupsupers > 0
    audio_play_sound(snd_incorrect,0,0);*/
else if global.Gdead > 0
{
    targetchoose = 1;
    phase = 3;
    //audio_play_sound(snd_confirm,0,0);
}
else
{
    do
    {
        if targetchoose = 0
            targetchoose += 1;
        if targetchoose > 2
            targetchoose = 0;
    }
    until (instance_exists(obj_battlecontrol.broid[targetchoose]));
    phase = 3;
    //audio_play_sound(snd_confirm,0,0);
}