//Make gravity
if zgravityon = 1
    zspeed += zgravity;
z += zspeed; //Changes the height of the jump (the greater z is, the higher Mario is)
if z > 11
    falling = 1;
if z <= 0
{
    if falling = 1
        visible = false;
    zspeed = 0;
    z = 0;
    zgravityon = 0;
    ground = 1;
}
if ground = 0 && obj_pep_battle.moveto = 7 && global.turn = 0
    x -= 1;
if ground = 0 && obj_pep_battle.moveto = 10 && global.turn = 0
{
    x -= 1;
    y += 3;
}
if ground = 0 && obj_gustavob.moveto = 7 && global.turn = 1
    x -= 1;
if ground = 0 && obj_gustavob.moveto = 10 && global.turn = 1
    y -= 3;