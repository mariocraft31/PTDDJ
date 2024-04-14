function scr_nextmsg() {
    msgno += 1
    lineno = 0
    aster = false
    halt = false
    pos = 1
    alarm[0] = 1
    drawaster = false
    autoaster = false
    miniface_pos = 0
    miniface_current_pos = -1
    mystring = nstring[msgno]
    formatted = false
    wxskip = 0
    sound_played = false
    forcebutton1 = false
    if (rate < 3)
    {
        firstnoise = false
        alarm[2] = 1
    }
    return;
}

function msgsetsub(msg_id, stri, args) {
    var len = argument_count
    for (var i = 0; i < len; i++)
        args[i] = argument[i]
    var str = substringargs(argument[1], 2, args)
    msgset(argument[0], str)
    return;
}

function msgnextsub(stri, args) {
    var len = argument_count
    for (var i = 0; i < len; i++)
        args[i] = argument[i]
    var str = substringargs(argument[0], 1, args)
    msgnext(str)
    return;
}

function msgsetloc(msg_id, stri) {
    var msg_index = argument0
    var str = argument1
    msgset(msg_index, str)
    return;
}

function msgset(msg_id,stri) {
    global.msgno = argument0
    global.msg[argument0] = argument1
    return;
}

function msgnextloc(stri) {
    var str = argument0
    msgnext(str)
    return;
}

function msgnext(stri) {
    global.msgno++
    msgset(global.msgno, argument0)
    return;
}

function scr_asterskip() {
    if (aster == true && autoaster == true)
    {
        length += 2
        mystring = string_insert("||", mystring, i)
    }
    if (aster == 2)
        aster = true
    return;
}

function scr_anyface_next(face, index) {
    global.msgno++
    scr_anyface(argument0, global.msgno, argument1)
    return;
}

function scr_anyface(_speakerC, _msgno, _emotion) {
    _speakerC = argument0
    _msgno = argument1
    _emotion = argument2
    if is_real(argument2)
    {
        if (argument2 >= 10)
        {
            if (argument2 < 36)
                _emotion = chr((55 + argument2))
            else
                _emotion = chr((61 + argument2))
        }
    }
    _speaker = string_lower(_speakerC)
    if (_speaker == "peppino")
	{
        scr_pepface(_msgno, _emotion)
	}
	if (_speaker == "none" || _speaker == "x" || _speaker == "no name" || _speaker == "no_name" || _speaker == "test")
	{
        scr_noface(_msgno)
	}
	if (_speaker == "shake")
        scr_noface_shake(_msgno)
    return;
}

function scr_speaker(speaker) {
    _speaker = argument0
    global.typer = 5
    global.portrait = 0
    global.fe = 0
    if (_speaker == "silent")
        global.typer = 2
	if (_speaker == "shake")
        global.typer = 6
    if (_speaker == "balloon" || _speaker == "enemy")
        global.typer = 50
    if (_speaker == "peppino")
    {
        global.portrait = 1
        global.typer = 62
    }
    return;
}


