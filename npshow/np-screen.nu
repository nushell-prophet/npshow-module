export def --env main [
    central_part
    --url = ''
    --no_date
] {
    $env.PROMPT_COMMAND = {|| "\n> "}

    let np = 'nushell-prophet'
        | figlet -C utf8 -f phm-rounded
        | lines
        | center
        | prepend "\n\n"
        | str join (char nl)

    let mod = $central_part
        | table
        | lines
        | center
        | str join (char nl)

    let $bottom_end = (ansi grey)
        | append ($url | center)
        | append (char nl)
        | if not $no_date {
            append (date now | format date %F | center)
        } else {}
        | append (ansi reset)
        | str join

    clear; print $np '' '' '' '' $mod '' '' '' '' $bottom_end
}

def center [] {
    fill -a center --width (term size).columns
}
