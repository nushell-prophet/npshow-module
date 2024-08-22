export use np-screen.nu

export def print-header [ ] {
    str upcase | figlet -w 140 -f 'phm-largetype.flf' -C utf8 | lines | fill -a center --width ((term size).columns - 4) | table --index false
};

export def add-gradient [] {
    let $input = $in
    gradient-screen --no_date --echo --rows (((term size).rows - ($input | lines | length)) / 2 | into int)
    | $in + $input + $in
}
