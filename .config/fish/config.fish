if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x EDITOR nvim

fish_add_path /opt/local/bin
fish_add_path /opt/local/sbin

set -x JAVA_HOME ~/jdk-20.jdk/Contents/Home
fish_add_path $JAVA_HOME
