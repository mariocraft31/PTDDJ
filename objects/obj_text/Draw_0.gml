button1 = 0
button2 = 0
miniface_drawn = -1
if (keyboard_check_pressed(ord("Z")) == 1 && prevent_mash_buffer <= 0)
    button1 = 1
if (keyboard_check_pressed(ord("X")) == 1 && prevent_mash_buffer <= 0)
    button2 = 1
if forcebutton1
    button1 = 1
prevent_mash_buffer--
if (dialoguer == 1 && formatted == false)
{
        charline = originalcharline
        writingx = x
    if instance_exists(obj_dialog_box)
    {
		
        if (obj_dialog_box.zurasucon == 2)
        {
            writingx = (camerax() + obj_dialog_box.remwriterx)
            //if (global.portrait > 0)
             //   writingx = ((camerax() + obj_dialog_box.remwriterx) + (58 * f))
        }
    }
}
if (formatted == false)
{
    length = string_length(mystring)
    charpos = -1
    remspace = -1
    remchar = -1
    linecount = 0
    stringmax = 0
    aster = false
    for (i = 0; i < (length + 1); i += 1)
    {
        skip = false
        thischar = string_char_at(mystring, i)
        if (thischar == "`")
            i++
        else if (thischar == "/" || thischar == "%")
        {
			global.talker = -1
            if (charpos > -1)
                charpos -= 1
        }
        else if (thischar == "^")
        {
            if (charpos > -1)
                charpos -= 2
        }
        else if (thischar == "\\")
        {
            if (charpos > -1)
                charpos -= 3
            if (dialoguer == 1)
            {
                nextchar = string_char_at(mystring, (i + 1))
                nextchar2 = string_char_at(mystring, (i + 2))
                if (nextchar == "E")
                {
                    __nextface = ord(nextchar2)
                    if (__nextface >= 48 && __nextface <= 57)
                        global.fe = real(nextchar2)
                    else if (__nextface >= 65 && __nextface <= 90)
                        global.fe = (__nextface - 55)
                    else if (__nextface >= 97 && __nextface <= 122)
                        global.fe = (__nextface - 61)
                }
                if (nextchar == "F")
                {
                    if (nextchar2 == "0")
                        global.portrait = 0
                    if (nextchar2 == "S")
                        global.portrait = 1
                    if (nextchar2 == "R")
                        global.portrait = 2
                    if (nextchar2 == "N")
                        global.portrait = 3
                    if (nextchar2 == "T")
                        global.portrait = 4
                    if (nextchar2 == "L")
                        global.portrait = 5
                    if (nextchar2 == "s")
                        global.portrait = 6
                    if (nextchar2 == "U")
                        global.portrait = 9
                    if (nextchar2 == "A")
                        global.portrait = 10
                    if (nextchar2 == "a")
                        global.portrait = 11
                    if (nextchar2 == "B")
                        global.portrait = 12
                    if (nextchar2 == "r")
                        global.portrait = 15
                    if (nextchar2 == "u")
                        global.portrait = 18
                    if (nextchar2 == "K")
                        global.portrait = 20
                    if (nextchar2 == "Q")
                        global.portrait = 21
                    if (global.portrait == 0)
                    {
                        charline = originalcharline
                        writingx = x
                    }
                    else
                    {
                        charline = 26
                        writingx = (x + (58 * f))
                    }
                }
                if (nextchar == "m")
                    drawaster = false
                if (nextchar == "s")
                {
                    if (nextchar2 == "0")
                        skippable = false
                }
            }
        }
        else if (thischar == "&" || thischar == "\n")
        {
            if (charpos > stringmax)
                stringmax = charpos
            remspace = -1
            charpos = 0
            linecount += 1
            skip = true
            nextchar = string_char_at(mystring, (i + 1))
        }
        if (skip == false)
        {
            if (thischar == " ")
            {
                remspace = i
                remchar = charpos
            }
            if (thischar == "*")
                aster = true
            if (charpos >= charline)
            {
                if (remspace > 2)
                {
                    mystring = string_delete(mystring, remspace, 1)
                    mystring = string_insert("&", mystring, remspace)
                    i = (remspace + 1)
                    if (remchar > stringmax)
                        stringmax = remchar
                    remspace = -1
                    charpos = 1
                    linecount += 1
                    scr_asterskip()
                }
                else
                {
                    if (charpos > stringmax)
                        stringmax = charpos
                    mystring = string_insert("&", mystring, i)
                    length += 1
                    charpos = 1
                    remspace = -1
                    linecount += 1
                    i += 1
                    scr_asterskip()
                }
            }
            else
                charpos += 1
        }
    }
    if (autocenter == 1)
    {
        x = (((camerax() + (camerawidth() / 2)) - ((stringmax * hspace) / 2)) + 5)
        y = (((cameray() + (cameraheight() / 2)) - ((writingy + ((linecount + 1) * vspace)) / 2)) - 10)
    }
    if (charpos > stringmax)
        stringmax = charpos
    formatted = true
}
accept = false
wx = writingx
wy = writingy
colorchange = false
draw_set_font(myfont)
draw_set_color(mycolor)
if (halt == false && button2 == 1 && pos < length && skippable == true)
    skipme = true
if (skipme == true)
{
    pos = (string_length(mystring) + 1)
    reachedend = 1
    alarm[0] = -1
    alarm[1] = -1
}
for (n = 1; n < pos; n += 1)
{
    accept = true
    mychar = string_char_at(mystring, n)
    if (mychar == "`")
    {
        n++
        mychar = string_char_at(mystring, n)
    }
    else if (mychar == "&" || mychar == "\n")
    {
        accept = false
        wx = writingx
        if (wxskip == 1)
            wx = (writingx + 58)
        wy += vspace
    }
    else if (mychar == "|")
    {
        accept = false
        wx += hspace
    }
    else if (mychar == "^")
    {
        accept = false
        n += 1
    }
    else if (mychar == "/")
    {
		global.talker = -1
        halt = true
        if (string_char_at(mystring, (n + 1)) == "%")
            halt = 2
        accept = false
    }
    else if (mychar == "%")
    {
        accept = false
        if (string_char_at(mystring, (n - 1)) == "/")
            halt = 2
        if (string_char_at(mystring, (n + 1)) == "%")
            instance_destroy()
        else if (halt != 2)
            scr_nextmsg()
    }
    else if (mychar == "\\")
    {
        nextchar = string_char_at(mystring, (n + 1))
        nextchar2 = string_char_at(mystring, (n + 2))
        if (nextchar == "E")
        {
            __nextface = ord(nextchar2)
            if (__nextface >= 48 && __nextface <= 57)
                global.fe = real(nextchar2)
            else if (__nextface >= 65 && __nextface <= 90)
                global.fe = (__nextface - 55)
            else if (__nextface >= 97 && __nextface <= 122)
                global.fe = (__nextface - 61)
        }
        if (nextchar == "F")
        {
            if (nextchar2 == "0")
                global.portrait = 0
            if (nextchar2 == "S")
                global.portrait = 1
            if (nextchar2 == "R")
                global.portrait = 2
            if (nextchar2 == "N")
                global.portrait = 3
            if (nextchar2 == "T")
                global.portrait = 4
            if (nextchar2 == "L")
                global.portrait = 5
            if (nextchar2 == "s")
                global.portrait = 6
            if (nextchar2 == "A")
                global.portrait = 10
            if (nextchar2 == "a")
                global.portrait = 11
            if (nextchar2 == "B")
                global.portrait = 12
            if (nextchar2 == "b")
                global.portrait = 19
            if (nextchar2 == "r")
                global.portrait = 15
            if (nextchar2 == "u")
                global.portrait = 18
            if (nextchar2 == "U")
                global.portrait = 9
            if (nextchar2 == "K")
                global.portrait = 20
            if (nextchar2 == "Q")
                global.portrait = 21
            if (dialoguer == 1)
            {
                if (global.portrait == 0)
                {
                    charline = originalcharline
                    wx = x
                }
                else
                {
                    charline = 26
                    wx = (x + (58 * f))
                }
            }
        }
        if (nextchar == "f" && faced == 0)
        {
            fam = 0
            fam = real(nextchar2)
            if (!instance_exists(global.sminstance[fam]))
            {
                //global.sminstance[fam] = instance_create(global.smxx[fam], global.smyy[fam], obj_smallface)
                smallface = global.sminstance[fam]
                if instance_exists(smallface)
                {
                    smallface.x += x
                    smallface.y += y
                    smallface.speed = global.smspeed[fam]
                    smallface.direction = global.smdir[fam]
                    smallface.type = global.smtype[fam]
                    smallface.sprite_index = global.smsprite[fam]
                    smallface.image_speed = global.smimagespeed[fam]
                    smallface.image_index = global.smimage[fam]
                    smallface.alarm[0] = global.smalarm[fam]
                    smallface.mystring = global.smstring[fam]
                    smallface.mycolor = global.smcolor[fam]
                }
            }
        }
        if (nextchar == "*")
        {
        //   wx = round(wx)
        //    var _sprite = scr_getbuttonsprite(nextchar2, true)
        //    var y_offset = 0
        //    var x_offset = 0
        //    if (global.typer == 50 || global.typer == 70 || global.typer == 71)
        //    {
        //        x_offset = -3
        //        y_offset = -9
        //    }
        //    draw_sprite_ext(_sprite, 0, (wx + x_offset), ((wy + 2) + y_offset), 2, 2, 0, c_white, 1)
        }
        if (nextchar == "T")
        {
            if (nextchar2 == "0")
            {
				global.name = ""
                global.typer = 5
                scr_texttype()
            }
			if (nextchar2 == "1")
            {
				global.name = ""
                global.typer = 6
                scr_texttype()
            }
            if (nextchar2 == "P")
            {
				global.name = "PEPPINO"
                global.typer = 10
                scr_texttype()
            }
            if (dialoguer == 1)
            {
                if (global.portrait == 0)
                {
                    charline = originalcharline
                    wx = x
                }
                else
                    wxskip = 1
            }
        }
        if (nextchar == "s")
        {
            if (nextchar2 == "0")
                skippable = false
            if (nextchar2 == "1")
                skippable = true
        }
        if (nextchar == "c")
        {
            colorchange = true
            if (nextchar2 == "R")
                xcolor = c_red
            if (nextchar2 == "B")
                xcolor = c_blue
            if (nextchar2 == "Y")
                xcolor = c_yellow
            if (nextchar2 == "G")
                xcolor = c_lime
            if (nextchar2 == "W")
                xcolor = c_white
            if (nextchar2 == "X")
                xcolor = c_black
            if (nextchar2 == "P")
                xcolor = c_purple
            if (nextchar2 == "M")
                xcolor = c_maroon
            if (nextchar2 == "S")
                xcolor = hexcolor(16744703)
            if (nextchar2 == "V")
                xcolor = hexcolor(8454016)
            if (nextchar2 == "0")
                xcolor = mycolor
        }
        if (nextchar == "C")
        {
            if (nextchar2 == "1")
            {
                //if (instance_exists(obj_choicer_old) == 0)
                //    choicer = instance_create(0, 0, obj_choicer_old)
                halt = 5
            }
            if (nextchar2 == "2" || nextchar2 == "3" || nextchar2 == "4")
            {
                //if (instance_exists(obj_choicer_neo) == 0)
                //{
                //    choicer = instance_create(0, 0, obj_choicer_neo)
                //    choicer.choicetotal = (real(nextchar2) - 1)
                //}
                halt = 5
            }
        }
        if (nextchar == "M")
        {
            if (nextchar2 == "0")
                global.flag[20] = 0
            if (nextchar2 == "1")
                global.flag[20] = 1
            if (nextchar2 == "2")
                global.flag[20] = 2
                global.flag[20] = 2
            if (nextchar2 == "3")
                global.flag[20] = 3
            if (nextchar2 == "4")
                global.flag[20] = 4
            if (nextchar2 == "5")
                global.flag[20] = 5
            if (nextchar2 == "6")
                global.flag[20] = 6
            if (nextchar2 == "7")
                global.flag[20] = 7
            if (nextchar2 == "8")
                global.flag[20] = 8
            if (nextchar2 == "9")
                global.flag[20] = 9
        }
        if (nextchar == "S")
        {
            if (sound_played == false)
            {
                for (i = 0; i < 10; i += 1)
                {
                    if (nextchar2 == string(i) && sound_played == false)
                    {
                        snd_play(global.writersnd[i])
                        sound_played = true
                    }
                }
            }
        }
        if (nextchar == "I")
        {
            for (i = 0; i < 10; i += 1)
            {
                if (nextchar2 == string(i))
                    draw_sprite(global.writerimg[i], 0, wx, (wy + 4))
            }
        }
        if (nextchar == "m")
        {
            drawaster = false
            for (i = 0; i < 10; i += 1)
            {
                if (nextchar2 == string(i))
                {
                    if (n >= miniface_current_pos)
                    {
                        miniface_image = (miniface_pos / 4)
                        miniface_current_pos = n
                    }
                    else
                        miniface_image = 0
                    draw_sprite_ext(global.writerimg[i], miniface_image, (writingx - 8), (wy - 4), 2, 2, 0, mycolor, 1)
                    miniface_drawn = i
                }
            }
        }
        accept = false
        n += 2
    }
    if (accept == true)
    {
        if (drawaster == false && mychar == "*")
            mychar = " "
        if (colorchange == true)
            draw_set_color(xcolor)
        if (mychar == "#")
        {
            if (string_char_at(mystring, (n - 1)) != "`")
                mychar = string_hash_to_newline(mychar)
        }
        if (special == false)
            draw_text_transformed((wx + random(shake)), (wy + random(shake)), mychar, textscale, textscale, 0)
        if (special >= true)
        {
            if (special == true)
            {
                if (draw_get_color() != 16777215 && draw_get_color() != 0)
                {
                    draw_text_color(((wx + random(shake)) + 1), ((wy + random(shake)) + 1), mychar, xcolor, xcolor, xcolor, xcolor, 0.3)
                    draw_text_color((wx + random(shake)), (wy + random(shake)), mychar, c_white, c_white, xcolor, xcolor, 1)
                }
                else
                {
                    draw_text_color(((wx + random(shake)) + 1), ((wy + random(shake)) + 1), mychar, c_dkgray, c_dkgray, c_navy, c_navy, 1)
                    draw_text((wx + random(shake)), (wy + random(shake)), mychar)
                }
            }
            if (special == 2)
            {
                draw_set_alpha((1 * specfade))
                draw_text(wx, wy, mychar)
                draw_set_alpha(((0.3 + (sin((siner / 14)) * 0.1)) * specfade))
                draw_text((wx + 1), wy, mychar)
                draw_text((wx - 1), wy, mychar)
                draw_text(wx, (wy + 1), mychar)
                draw_text(wx, (wy - 1), mychar)
                draw_set_alpha(((0.08 + (sin((siner / 14)) * 0.04)) * specfade))
                draw_text((wx + 1), (wy + 1), mychar)
                draw_text((wx - 1), (wy - 1), mychar)
                draw_text((wx - 1), (wy + 1), mychar)
                draw_text((wx + 1), (wy - 1), mychar)
                draw_set_alpha(1)
            }
            if (special == 3)
            {
                draw_set_color(c_white)
                draw_set_alpha(1)
                draw_text((wx + sin((siner / 4))), (wy + cos((siner / 4))), mychar)
                draw_set_alpha(0.5)
                draw_text((wx + sin((siner / 5))), (wy + cos((siner / 5))), mychar)
                draw_text((wx + sin((siner / 7))), (wy + cos((siner / 7))), mychar)
                draw_text((wx + sin((siner / 9))), (wy + cos((siner / 9))), mychar)
                for (i = 0; i < 7; i += 1)
                {
                    ddir = (315 + random(15))
                    if (n == 1)
                    {
                        specx[i] += lengthdir_x(2, ddir)
                        specy[i] += lengthdir_y(2, ddir)
                        if (specx[i] >= 40)
                        {
                            specx[i] = 0
                            specy[i] = 0
                        }
                    }
                    draw_set_alpha((((40 - specx[i]) / 40) * 0.7))
                    draw_text((wx + specx[i]), (wy + specy[i]), mychar)
                }
                draw_set_alpha(1)
            }
        }
        wx += hspace
    }
}
if (halt != false && button1 == 1 && siner > 0)
{
    if (halt == true)
    {
		global.name = ""
        scr_nextmsg()
    }
    if (halt == 2)
    {
        if (facer == 1)
        {
            with (obj_portrait)
                instance_destroy()
        }
		global.name = ""
        instance_destroy()
    }
}
skipme = false
siner += 1

