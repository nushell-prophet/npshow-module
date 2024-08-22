export def --env main [
    central_part
    --url = ''
    --no_date
    --lines_before: int = 2
    --$lines_between: = 3
] {
    $env.PROMPT_COMMAND = {|| "\n> "}

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
