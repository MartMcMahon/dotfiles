if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x EDITOR nvim

fish_add_path /opt/local/bin
fish_add_path /opt/local/sbin

set -x JAVA_HOME ~/jdk-20.jdk/Contents/Home
fish_add_path $JAVA_HOME

function fish_prompt 
  echo (set_color cyan)(whoami) (set_color purple)(prompt_pwd) (set_color white)"\$ "
end



function fish_right_prompt
    set -l _last_status $status

    set -l gray (set_color 888)
    set -l green (set_color green)
    set -l red (set_color red)
    set -l yellow (set_color yellow)
    set -l blue (set_color blue)
    set -l magenta (set_color magenta)
    set -l cyan (set_color cyan)
    set -l normal (set_color normal)
    
    set -l output

    # python 
    if set -q VIRTUAL_ENV
        set -l py_env (basename $VIRTUAL_ENV)
        set -a output $blue " $py_env " $normal
    else if set -q CONDA_DEFAULT_ENV
        set -a output $blue " $CONDA_DEFAULT_ENV " $normal
    end

    # node
    if test -f .nvmrc -o -f package.json
        set -l node_ver (node -v 2>/dev/null | string trim -c 'v')
        if test -n "$node_ver"
            set -a output $green " $node_ver " $normal
        end
    end

    # rust 
    if test -f Cargo.toml
        set -l rust_ver (rustc --version 2>/dev/null | string split " ")[2]
        if test -n "$rust_ver"
            set -a output $magenta " $rust_ver " $normal
        end
    end




    # git branch
    if command -q git
        set -l git_info (fish_git_prompt "%s ")
        if test -n "$git_info"
            set -a output $green $git_info $normal
        end
    end

    # failed command
    if test $_last_status -ne 0
        set -a output $red "✘ $_last_status " $normal
    end

    # duration
    if set -q CMD_DURATION
        set -l duration (math -s1 "$CMD_DURATION/1000")
        if test $duration -ge 3600  # 1+ hours
            set -a output $red (printf "%.1fh" (math -s1 "$duration/3600")) $normal
        else if test $duration -ge 60  # 1+ minutes
            set -a output $yellow (printf "%.1fm" (math -s1 "$duration/60")) $normal
        else if test $duration -ge 1  # 1+ seconds
            set -a output $yellow (printf "%.1fs" $duration) $normal
        else if test $duration -ge 100  # 100+ ms
        else
            set -a output $gray (printf "%.0fms" (math -s1 "$duration*1000")) $normal
        end
    end

    echo -n -s $output
end
