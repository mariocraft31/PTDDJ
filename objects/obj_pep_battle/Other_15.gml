if global.Pstache >= 999
{
    global.Pstache = 999;
    global.luckyhit = true;
}
else
{
    if global.Pstache >= random(999)
        global.luckyhit = true;
    else
        global.luckyhit = false; 
}