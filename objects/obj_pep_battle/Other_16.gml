//Choose Enemy Target
do
{
    targetchoose += 1;
    if targetchoose > 5
        targetchoose = 0;
}
until (instance_exists(obj_battlecontrol.enemyid[targetchoose]));
phase = 3;
//audio_play_sound(snd_confirm,0,0);