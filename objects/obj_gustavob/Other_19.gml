held = 0;

//Striking with Hammer
if sprite_index = spr_luigibhammerstrikestart && image_index < 8
    held = 2;

//Dodging
if global.turn = 2 && phase = -2 && hammering = 1 && hammerdodgewait = 0 && hurt = 0 //Hammer releasing
{
    if !image_index = 0
        image_index = 0;
    sprite_index = spr_luigibhammer;
    hammering = 0;
    hammerdodgewait = 0;
    hammerdodgego = 1;
    control = 0;
    held = 2;
}