//Running Away
if global.Pdead > 0
{
    audio_play_sound(sfx_jump,0,0);
    moveto = 11; //Move to Mario
}
else
    phase = -3;