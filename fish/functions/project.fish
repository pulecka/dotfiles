function project
  set dir ~/Developer
  set template ~/Developer/dotfiles/vagrant/project.tmux

  function _create_project -a name dir repo template
    echo "$name $dir $repo"
    echo "cp $template $dir/$name.tmux"
    cp $template $dir/$name.tmux
    sed -i '' s/__NAME__/$name/g $dir/$name.tmux
    sed -i '' s/__REPO__/$repo/g $dir/$name.tmux
    touch $dir/notes.md
  end

  if test (count $argv) -lt 1
    echo "Starting interactive mode..."
    read -P "Choose project name: " name
    while test -z $name
      read -P "Really need the project name: " name
    end
    read -c ~/Developer -P "Choose project directory: " dir
    while test ! -d $dir
      read -P "Really need valid project directory: " dir
    end
    read -c "$name" -P "Choose project repository: " repo
    while test -z $repo
      read -P "Really need the project repository: " repo
    end
    _create_project $name $dir $repo $template
    return 0
  end

  argparse h/help d/directory= r/repo= -- $argv
  or return

  if set -q _flag_help
    echo "mybetterfunction [-h|--help] [-s|--second] [ARGUMENTS...]"
    echo 'Prints pdf files from markdowns.'
    echo 'Usage: print.sh [options]'
    echo ''
    echo 'Options:'
    echo '  -i, --input                   Specify path to markdown file or directory with markdown files.'
    echo '                                  Current directory is used by default.'
    echo '  -o, --output                  Specify path to output directory.'
    echo '                                  Current directory is used by default.'
    echo '  -v, --version                 Show script version.'
    echo '  -h, --help                    Show usage help.'
    return 0
  end


  if set -q argv[1]
    set name $argv[1]
  else
    echo "Missing project name."
    return 1
  end

  if set -q _flag_dir
    if test -d $_flag_dir
      set name $argv[1]
    else
      echo "$_flag_root is not valid directory."
      return 1
    end
  end

  if set -q _flag_repo
    set repo $_flag_repo
  else
    set repo $name
  end

  _create_project $name $dir $repo $template
end
