/// EaseLinear(inputvalue,outputmin,outputmax,inputmax)
function EaseLinear(argument0,argument1,argument2,argument3)
{
return argument2 * argument0 / argument3 + argument1;
}
/// EaseInQuad(inputvalue,outputmin,outputmax,inputmax)
function EaseInQuad(argument0,argument1,argument2,argument3)
{
argument0 /= argument3;
return argument2 * argument0 * argument0 + argument1;
}
/// EaseOutQuad(inputvalue,outputmin,outputmax,inputmax)
function EaseOutQuad(argument0,argument1,argument2,argument3)
{
argument0 /= argument3;
return -argument2 * argument0 * (argument0 - 2) + argument1;
}
/// EaseInOutQuad(inputvalue,outputmin,outputmax,inputmax)
function EaseInOutQuad(argument0,argument1,argument2,argument3)
{
argument0 /= argument3 * 0.5;

if (argument0 < 1)
{
    return argument2 * 0.5 * argument0 * argument0 + argument1;
}

return argument2 * -0.5 * (--argument0 * (argument0 - 2) - 1) + argument1;
}

/// EaseInCubic(inputvalue,outputmin,outputmax,inputmax)
function EaseInCubic(argument0,argument1,argument2,argument3)
{
return argument2 * power(argument0/argument3, 3) + argument1;
}
/// EaseOutCubic(inputvalue,outputmin,outputmax,inputmax)
function EaseOutCubic(argument0,argument1,argument2,argument3)
{
return argument2 * (power(argument0/argument3 - 1, 3) + 1) + argument1;
}
/// EaseInOutCubic(inputvalue,outputmin,outputmax,inputmax)
function EaseInOutCubic(argument0,argument1,argument2,argument3)
{
argument0 /= argument3 * 0.5;

if (argument0 < 1)
{
   return argument2 * 0.5 * power(argument0, 3) + argument1;
}

return argument2 * 0.5 * (power(argument0 - 2, 3) + 2) + argument1;
}
/// EaseInQuart(inputvalue,outputmin,outputmax,inputmax)
function EaseInQuart(argument0,argument1,argument2,argument3)
{
return argument2 * power(argument0 / argument3, 4) + argument1;
}
/// EaseOutQuart(inputvalue,outputmin,outputmax,inputmax)
function EaseOutQuart(argument0,argument1,argument2,argument3)
{
return -argument2 * (power(argument0 / argument3 - 1, 4) - 1) + argument1;
}
/// EaseInOutQuart(inputvalue,outputmin,outputmax,inputmax)
function EaseInOutQuart(argument0,argument1,argument2,argument3)
{
argument0 /= argument3 * 0.5;

if (argument0 < 1) 
{
    return argument2 * 0.5 * power(argument0, 4) + argument1;
}

return argument2 * -0.5 * (power(argument0 - 2, 4) - 2) + argument1;
}
/// EaseInQuint(inputvalue,outputmin,outputmax,inputmax)
function EaseInQuint(argument0,argument1,argument2,argument3)
{
return argument2 * power(argument0 / argument3, 5) + argument1;
}
/// EaseOutQuint(inputvalue,outputmin,outputmax,inputmax)
function EaseOutQuint(argument0,argument1,argument2,argument3)
{
return argument2 * (power(argument0 / argument3 - 1, 5) + 1) + argument1;
}
/// EaseInOutQuint(inputvalue,outputmin,outputmax,inputmax)
function EaseInOutQuint(argument0,argument1,argument2,argument3)
{
argument0 /= argument3 * 0.5;

if (argument0 < 1)
{
    return argument2 * 0.5 * power(argument0, 5) + argument1;
}

return argument2 * 0.5 * (power(argument0 - 2, 5) + 2) + argument1;
}
/// EaseInSine(inputvalue,outputmin,outputmax,inputmax)
function EaseInSine(argument0,argument1,argument2,argument3)
{
return argument2 * (1 - cos(argument0 / argument3 * (pi / 2))) + argument1;
}
/// EaseOutSine(inputvalue,outputmin,outputmax,inputmax)
function EaseOutSine(argument0,argument1,argument2,argument3)
{
return argument2 * sin(argument0 / argument3 * (pi / 2)) + argument1;
}
 /// EaseInOutSine(inputvalue,outputmin,outputmax,inputmax)
function EaseInOutSine(argument0,argument1,argument2,argument3)
{
return argument2 * 0.5 * (1 - cos(pi * argument0 / argument3)) + argument1;
}
/// EaseInCirc(inputvalue,outputmin,outputmax,inputmax)
function EaseInCirc(argument0,argument1,argument2,argument3)
{
argument0 /= argument3;
return argument2 * (1 - sqrt(1 - argument0 * argument0)) + argument1;
}
/// EaseOutCirc(inputvalue,outputmin,outputmax,inputmax)
function EaseOutCirc(argument0,argument1,argument2,argument3)
{
argument0 = argument0 / argument3 - 1;
return argument2 * sqrt(1 - argument0 * argument0) + argument1;
}
/// EaseInOutCirc(inputvalue,outputmin,outputmax,inputmax)
function EaseInOutCirc(argument0,argument1,argument2,argument3)
{
argument0 /= argument3 * 0.5;

if (argument0 < 1)
{
    return argument2 * 0.5 * (1 - sqrt(1 - argument0 * argument0)) + argument1;
}

argument0 -= 2;
return argument2 * 0.5 * (sqrt(1 - argument0 * argument0) + 1) + argument1;
}