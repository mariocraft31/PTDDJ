if global.turn = 0 or obj_pep_battle.moveto = 9
{
    obj_pep_battle.moveto = 0;
    obj_pep_battle.phase = 4;
    with obj_pep_battle event_user(4);
}
else if global.turn = 1 or obj_gustavob.moveto = 9
{
    obj_gustavob.moveto = 0;
    obj_gustavob.phase = 4;
}
//global.Mitem = 0;
//global.Litem = 0;
instance_destroy();

