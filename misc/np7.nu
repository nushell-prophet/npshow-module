npshow np-screen {
    issue: '007'
    manual: $"Format your nushell code using (ansi yellow)topiary-nushell(ansi reset):\n - demo\n - how to install (ansi yellow)topiary-nushell(ansi reset)\n - custom command to format one-liners"

    '': ''
    udpated: (date now | format date %F)
} --no_date --url 'https://github.com/nushell-prophet/nushell-show' --lines_before 0 --lines_between 1