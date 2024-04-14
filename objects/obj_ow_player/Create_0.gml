global.palettetexture = -4;
global.palettesurface = -4;
global.palettesurfaceclip = -4;

z = 0; /*z pos*/
floorz = 0; /*z pos of floor beneath you*/
zspeed = 11; /*speed of jump*/
zgrav = 0; /*changes, applies downforce*/
jump = false; /*if in air*/

state = 0;
cutscene = 1;
debug = false;

onebuffer = 0
twobuffer = 0
threebuffer = 0
cutscene = 0
thisinteract = 0

invincible = 0;

move = false;
movespd = 6
mach3movespd = 12;

hsp = 0
vsp = 0

prevhsp = 0;
prevvsp = 0;
prevmovespeed = 0;

macheffect = false;
flash = false;
face = DOWN;

charge = 0;
toomuchalarm1 = 0;

tauntstoredstate = 0
tauntstoredmovespeed = 6
tauntstoredsprite = sprite_index;
taunttimer = 20
tauntstoredvsp = 0
taunttimer = 20;

character = "P"

usepalette = 1
spr_palette = spr_peppalette
scr_character_spr();
paletteselect = 1;

initwd = sprite_width
initht = sprite_height-128

active = true;

//global.z = 0; /* direction cam is facing, global z controls the z axis in which objects are drawn globally */