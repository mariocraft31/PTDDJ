function scr_pepface(msgno, stri) {
    global.msg[argument0] = stringset("\\TX \\F0 \\E" + string(argument1) + " \\FP \\TP %")
    return;
}

function scr_noface(msgno) {
    global.msg[argument0] = stringset("\\TX \\F0 \\T0 %")
    return;
}

function scr_noface_shake(msgno) {
    global.msg[argument0] = stringset("\\TX \\F0 \\T1 %")
    return;
}