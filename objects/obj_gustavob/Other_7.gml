//sets that at the end of certain animations, to change to the next
if sprite_index = spr_lhurt && global.turn = 0
{
    image_speed = 0;
    image_single = 0;
}
else
{
    if sprite_index = spr_luigibhammerstart && hurt = 0
    {
        image_index = 0;
        sprite_index = spr_luigibhammer;
    }
    if sprite_index = spr_luigibhammerhit && hurt = 0
    {
        hammeringdodge = 0;
        hammerdodgewait = 1;
        hammering = 0;
        hammerdodgego = 0;
        control = 1;
        hammeringdodge = 0;
        sprite_index = spr_lstance4;
    }
    if sprite_index = spr_luigibjumpdown1
        sprite_index = spr_luigibjumpdown2;
    if sprite_index = spr_luigibjumpland2 
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

if sprite_index = spr_lonegustavo_jumpstart
		sprite_index = spr_lonegustavo_jump;

if sprite_index = spr_luigibjumpland2 && phase = 1
    sprite_index = spr_lstance2;
if sprite_index = spr_lhurt && global.turn = 2 //Counterattacking
{
    if phase = -2
    {
        hammeringdodge = 0;
        sprite_index = spr_lstance4;
    }
    else
        sprite_index = spr_lstance3;
    hurt = 0;
}
//if sprite_index = spr_gustavoshoot
//    mode = 2;
if sprite_index = spr_luigibhammerstrikehit or sprite_index = spr_luigibhammerstrikefail
{
    sprite_index = spr_lonegustavo_walkback;
    moveto = 0;
}
if sprite_index = spr_luigibhammerstrikestart
{
    sprite_index = spr_luigibhammerstrikefail;
}
if sprite_index = spr_luigibhammerstrike
    sprite_index = spr_luigibhammerstrikehit;
if sprite_index = spr_luigibhandstrikehit or sprite_index = spr_luigibhandstrikefail
{
    sprite_index = spr_lonegustavo_walkback;
    moveto = 0;
}
if sprite_index = spr_luigibhandstrikestart
{
    held = 0;
    sprite_index = spr_luigibhandstrikefail;
}
if sprite_index = spr_luigibthrow or sprite_index = spr_luigibheal
{
    sprite_index = spr_stance1;
    stance = 1;
}
if sprite_index = spr_luigibswallow
    moveto = 9;
if sprite_index = spr_luigibthrowup
    moveto = 8;
if sprite_index = spr_luigibthrow
    moveto = 11;
if sprite_index = spr_luigipanic
{
    phase = 1;
    stance = 2;
    control = 1;
    reaction = 1;
}
if sprite_index = spr_luigipickupmario && global.Pdead = 1 && stance <> 6 //Run with Mario
{
    phase = -3;
    stance = 6;
    sprite_index = spr_luigibwalkingbackmario;
}


//Green Shell
if sprite_index = spr_lonegustavo_kick && stance = 16
{
    image_index = 0;
    sprite_index = spr_lonegustavo_idle;
    stance = 15;
}
if sprite_index = spr_luigibgreenshellfall
{
    var i;
    for (i = 0; i < 10; i++) //Repeat animation
        image_index = 0;
    stance = 1;
}
//Win
if sprite_index = spr_luigibwinspin_jump or sprite_index = spr_luigibwinspin_hammer or sprite_index = spr_luigibwinspin_hand
    image_single = 3;
//Lose
if sprite_index = spr_luigidie
    global.Gdead = 1;

