function __NAME__
  set PROJECT_ROOT __ROOT__
  set PROJECT_NAME __NAME__
  set PROJECT_HOME $PROJECT_ROOT/__REPO__

  argparse k/kill -- $argv
  or return

  if set -q _flag_kill
    tmux kill-session -t $PROJECT_NAME
    return 0
  end

  if tmux has-session -t $PROJECT_NAME 2> /dev/null
    if set -q argv[1]
      tmux attach -t $PROJECT_NAME:$argv[1]
    else
      tmux attach -t $PROJECT_NAME
    end
    return 0
  end

  tmux new-session -d -s $PROJECT_NAME -n editor -c $PROJECT_HOME 

  # 1. Editor
  tmux send-keys -t $PROJECT_NAME:editor "nvim ." Enter

  # 2. Source control
  tmux new-window -t $PROJECT_NAME -n source -c $PROJECT_HOME
  tmux send-keys -t $PROJECT_NAME:source "git fetch --prune" Enter
  tmux send-keys -t $PROJECT_NAME:source "C-l"
  tmux send-keys -t $PROJECT_NAME:source "git status" Enter

  # 3. Dev
  tmux new-window -t $PROJECT_NAME -n dev -c $PROJECT_HOME

  # 4. Build
  tmux new-window -t $PROJECT_NAME -n build -c $PROJECT_HOME

  # 5. Notes
  tmux new-window -t $PROJECT_NAME -n notes -c $PROJECT_ROOT
  tmux send-keys -t $PROJECT_NAME:notes "nvim $PROJECT_NAME.md" Enter

  if set -q argv[1]
    tmux attach -t $PROJECT_NAME:$argv[1]
  else
    tmux attach -t $PROJECT_NAME:editor
  end
end
