function rbenv_lookup
    set -l -vers (command rbenv versions bare| sort | grep "$argv[1]" | tail n1)
    
    if [ ! -z "$vers" ]
        echo $vers
        return
    else
        echo $argv
        return
    end
end
