function rbenv
    set -l command $argv[1]
    [ (count $argv) -gt 1 ]; and set -l args $argv[2..-1]
    
    
    switch "$command"
        case shell
            rbenv_shell (rbenv_lookup $args)
        case local global
            command rbenv $command (rbenv_lookup $args)
        case '*'
            command rbenv $command $args
    end
end
