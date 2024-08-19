export def main [
    central_part
    url = ''
] {
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

    let $bottom_end = (ansi grey) + $bottom_f + "\n" + $date_f + (ansi reset)

    clear; print $np '' '' '' '' $mod '' '' '' '' $bottom_end
}
