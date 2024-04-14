//sets that at the end of certain animations, to change to the next
if sprite_index = spr_mhurt && global.turn = 0
{
    image_speed = 0;
    image_single = 0;
}
else
{
    if sprite_index = spr_mariobjumpstart
        sprite_index = spr_mariobjumpup;
    if sprite_index = spr_mariobhammerstart && hurt = 0
    {
        image_index = 0;
        sprite_index = spr_mariobhammer;
    }
    if sprite_index = spr_mariobhammerhit && hurt = 0
    {
        hammeringdodge = 0;
        hammerdodgewait = 1;
        hammering = 0;
        hammerdodgego = 0;
        control = 1;
        hammeringdodge = 0;
        sprite_index = spr_stance4;
    }
    if sprite_index = spr_mariobjumpdown1
        sprite_index = spr_mariobjumpdown2;
    if sprite_index = spr_mariobjumpland2 
    {
        stance = 1;
        if moveto = 5 
        {
            stance = 0;
            if obj_gustavob.fluddthunderon = 1
                sprite_index = spr_fluddstand;
       }
    }
}

if sprite_index = spr_mariobjumpland2 && phase = 1
    sprite_index = spr_stance2;
if sprite_index = spr_mhurt && global.turn = 2 //Counterattacking
{
    if phase = -2
    {
        hammeringdodge = 0;
        sprite_index = spr_stance4;
    }
    else
        sprite_index = spr_pep_B_idle;
    hurt = 0;
}
if sprite_index = spr_pep_B_punch or sprite_index = spr_mariobhammerstrikefail
{
    sprite_index = spr_pep_B_moveback;
    moveto = 0;
}
if sprite_index = spr_mariobhammerstrikestart
    sprite_index = spr_mariobhammerstrikefail;

if sprite_index = spr_pep_B_punchprep
    sprite_index = spr_pep_B_punch
	
if sprite_index = spr_mariobhandstrikefail
{
    sprite_index = spr_pep_B_moveback;
    moveto = 0;
}
if sprite_index = spr_mariobhandstrikestart
    sprite_index = spr_mariobhandstrikefail;
if sprite_index = spr_fluddshoot
{
    moveto = 0;
    sprite_index = spr_pep_B_moveback;
    obj_gustavob.moveto = 0;
    obj_gustavob.sprite_index = spr_luigibwalkingback;
}
if sprite_index = spr_mariobthrow or sprite_index = spr_mariobheal
{
    sprite_index = spr_stance1;
    stance = 1;
}
if sprite_index = spr_mariobswallow
{
    moveto = 9;
}
if sprite_index = spr_mariobthrowup
    moveto = 8;
if sprite_index = spr_mariobthrow
    moveto = 11;
if sprite_index = spr_mariopanic
{
    phase = 1;
    stance = 2;
    control = 1;
    reaction = 1;
}
if sprite_index = spr_mariopickupluigi && global.Gdead = 1 && stance <> 6 //Run with gustavo
{
    if battleblock = 2 //Run from Battle
    {
        phase = -3;
        stance = 6;
        sprite_index = spr_mariobwalkingbackluigi;
    }
    else if battleblock <> 2 //Enemy Attacks
    {
        sprite_index = spr_stance1b;
        global.turn = 2;
    }
}

//Green Shell
if sprite_index = spr_pep_B_kick && stance = 16
{
    image_index = 0;
    sprite_index = spr_pep_B_idle
    stance = 15;
}
if sprite_index = spr_mariobgreenshellfall
{
    var i;
    for (i = 0; i < 10; i++) //Repeat animation
        image_index = 0;
    stance = 1;
}
//Win
if sprite_index = spr_mariobwinspin_jump or sprite_index = spr_mariobwinspin_hammer or sprite_index = spr_mariobwinspin_hand
    image_single = 3;
//Lose
if sprite_index = spr_mariodie
    global.Pdead = 1;

