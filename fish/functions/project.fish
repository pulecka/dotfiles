function project
  set dir ~/Developer
  set template $XDG_CONFIG_HOME/tmux/templates/project.fish

  function _create_project -a name dir repo template
    set project_file $XDG_CONFIG_HOME/fish/conf.d/$name.fish
    set repo_dir (basename $repo .git)

    cp $template $project_file
    sed -i '' "s|__ROOT__|$dir|g" $project_file
    sed -i '' "s/__NAME__/$name/g" $project_file
    sed -i '' "s/__REPO__/$repo_dir/g" $project_file
    
    mkdir -p $dir
    touch $dir/$name.md
    eval (cd $dir; git clone $repo)
    
    source $project_file
  end

  if test (count $argv) -lt 1
    echo "Starting interactive mode..."
    
    read -P "Choose project name: " name
    while test -z $name
      read -P "Really need the project name: " name
    end
    
    read -c ~/Developer -P "Choose project directory: " dir
    while test -z $dir
      read -P "Really need valid project directory: " dir
    end
    
    read -P "Choose project repository: " repo
    while test -z $repo
      read -P "Really need the project repository: " repo
    end
    
    if test -z (string match -r '.+\w+\.git/?' $repo)
      set repo git@github.com:$repo.git
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
    set dir $_flag_dir
  end

  if set -q _flag_repo
    if test -z (string match -r '.+\w+\.git/?' $_flag_repo)
      set repo git@github.com:$_flag_repo.git
    else
      set repo $_flag_repo
    end
  else
    echo "Missing project repository."
    return 1
  end

  _create_project $name $dir $repo $template
end
