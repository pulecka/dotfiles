function vagrantvm
  set dir ~/Developer
  set system 'macos'
  set macos_box 'pulecka/macos-12'
  set ubuntu_box 'bento/ubuntu-21.04'
  set templates $XDG_CONFIG_HOME/vagrant/templates

  function _create_vm -a name dir system box templates
    mkdir -p $dir/$name
    cp $templates/$system/Vagrantfile $dir/$name/Vagrantfile
    sed -i '' "s/__NAME__/$name/g" $dir/$name/Vagrantfile
    sed -i '' "s|__BOX__|$box|g" $dir/$name/Vagrantfile
  end

  if test (count $argv) -lt 1
    read -P 'Choose vm name: ' name
    while test -z $name
      read -P 'Really need the vm name: ' name
    end

    read -c 'macos' -P 'Choose vm system: ' system
    while test $system != 'macos' && test $system != 'ubuntu'
      read -P 'Really need the vm system (macos or ubuntu): ' system
    end

    switch $system
      case macos
        set box $macos_box
      case ubuntu
        set box $ubuntu_box
    end

    read -c "$box" -P 'Choose vm base box: ' box
    while test -z $box
      read -P 'Really need the vm base box: ' box
    end

    _create_vm $name $dir $system $box $templates
    return 0
  end

  argparse h/help s/system= b/box= -- $argv
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
    echo "Missing vm name."
    return 1
  end

  if set -q _flag_system
    switch $_flag_system
      case macos
        set system macos
        set box $macos_box
      case ubuntu
        set system ubuntu
        set box $ubuntu_box
      case '*'
        echo "$_flag_system is not supported system (macos or ubuntu)."
        return 1
    end
  end

  _create_project $name $dir $system $box $templates
end

