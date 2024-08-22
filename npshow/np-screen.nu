export def --env main [
    central_part
    --url = ''
    --no_date
] {
    $env.PROMPT_COMMAND = {|| "\n> "}

    let np = 'nushell-prophet'
        | figlet -C utf8 -f phm-rounded
        | lines
        | fill --alignment center --width (term size | get columns)
        | str join (char nl)
        | $"\n\n($in)";

    let mod = $central_part
        | table
        | lines
        | fill --alignment center --width (term size | get columns)
        | str join (char nl);

    let $bottom_f = $url | fill -a center --width (term size).columns
    let $date_f = date now | format date %F | fill -a center --width (term size).columns

    let $bottom_end = [
            (ansi grey)
            | append $bottom_f
            | (char nl)
            | if not $no_date {
                append $date_f
            } else {}
            | append (ansi reset)
        ]
        | str join

    clear; print $np '' '' '' '' $mod '' '' '' '' $bottom_end
}
