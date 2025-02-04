export def print-header [ ] {
    str upcase | figlet -w 140 -f 'phm-largetype.flf' -C utf8 | lines | fill -a center --width ((term size).columns - 4) | table --index false
};

export def add-gradient [] {
    let $input = $in
    gradient-screen --no_date --echo --rows (((term size).rows - ($input | lines | length)) / 2 | into int)
    | $in + $input + $in
}

export def --env np-screen [
    central_part
    --url = ''
    --no_date
    --lines_before: int = 2
    --lines_between: int = 3
] {
    $env.PROMPT_COMMAND = {|| pwd | path basename | $"\n..\/($in)"}

    clear;

    ("\n" | str_repeat $lines_before)
    | append ('nushell-prophet' | figlet -C utf8 -f phm-rounded | lines)
    | append ("\n" | str_repeat $lines_between)
    | append ($central_part | table | lines)
    | append ("\n" | str_repeat $lines_between)
    | append ($url | make_grey)
    | if $no_date {} else {
        append (date now | format date %F | make_grey)
    }
    | center
    | str join (char nl)
    | print

    sleep 1sec
}

def center [] {
    fill -a center --width (term size).columns
}

def str_repeat [n: int] {
    let $input = $in
    1..$n | each {$input} | str join
}

def make_grey [] {
    $'(ansi grey)($in)(ansi reset)'
}
