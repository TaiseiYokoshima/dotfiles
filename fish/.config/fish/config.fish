if status is-interactive
  alias l "exa --icons --sort=type"
  alias la "l -a"
  alias ll "l -l -g"
  alias lla "ll -a -g"

  alias lt "l -T"
  alias lat "la -T"
  alias llt "ll -T"
  alias llat "lla -T"
  alias v "nvim"
  alias g "git"
end

function fish_prompt
  set -l fish     "⋊>"

  set -l last_command_status $status
  set -l cwd

  if test pwd = "/home/$USER"
    set cwd "~"
  else
    set cwd (basename (prompt_pwd))
  end
  

  set -l normal_color     (set_color normal)
  set -l success_color    (set_color cyan)
  set -l error_color      (set_color $fish_color_error 2> /dev/null; or set_color red --bold)
  set -l directory_color  (set_color $fish_color_quote 2> /dev/null; or set_color brown)
  set -l repository_color (set_color $fish_color_cwd 2> /dev/null; or set_color green)

  if test -n "$SSH_CLIENT$SSH_TTY"
    set prompt_string (whoami)"@"(hostname -s)
  end


  echo -n -s " " $directory_color $cwd $normal_color " "


  if test $last_command_status -eq 0
    echo -n -s $success_color $fish $normal_color
  else
    echo -n -s $error_color $fish $normal_color
  end

  echo " " 

end



function fish_greeting
end




function fish_user_key_bindings
  # deletes default keybinds that are not necessary
  bind --erase --preset \ck kill-line
  bind --erase --preset \cu backward-kill-line
  bind --erase --preset \cy yank
  bind --erase --preset \ey yank-pop
  # deletes default keybinds that are not necessary bind --erase --preset \ck kill-line bind --erase --preset \cu backward-kill-line bind --erase --preset \cy yank bind --erase --preset \ey yank-pop
  bind --erase --preset -k right forward-char
  bind --erase --preset -k left backward-char
  bind --erase --preset \cl clear-screen
  bind --erase --preset \ed kill-word
  bind --erase --preset -k ppage beginning-of-history
  bind --erase --preset -k npage end-of-history
  bind --erase --preset \cx fish_clipboard_copy
  bind --erase --preset \cs pager-toggle-search
  bind --erase --preset -k btab complete-and-search
  bind --erase --preset -k sdc history-pager-delete or backward-delete-char
  bind --erase --preset \e\n commandline\ -f\ expand-abbr\;\ commandline\ -i\ \\n
  bind --erase --preset \e\r commandline\ -f\ expand-abbr\;\ commandline\ -i\ \\n
  bind --erase --preset -k down down-or-search
  bind --erase --preset -k up up-or-search
  bind --erase --preset -k sright forward-bigword
  bind --erase --preset -k sleft backward-bigword
  bind --erase --preset \e\eOC nextd-or-forward-word
  bind --erase --preset \e\eOD prevd-or-backward-word
  bind --erase --preset \e\e\[C nextd-or-forward-word
  bind --erase --preset \e\e\[D prevd-or-backward-word
  bind --erase --preset \eO3C nextd-or-forward-word
  bind --erase --preset \eO3D prevd-or-backward-word
  bind --erase --preset \e\[3C nextd-or-forward-word
  bind --erase --preset \e\[3D prevd-or-backward-word
  bind --erase --preset \e\[1\;9C nextd-or-forward-word
  bind --erase --preset \e\[1\;9D prevd-or-backward-word
  bind --erase --preset \e\eOA history-token-search-backward
  bind --erase --preset \e\eOB history-token-search-forward
  bind --erase --preset \e\e\[A history-token-search-backward
  bind --erase --preset \e\e\[B history-token-search-forward
  bind --erase --preset \eO3A history-token-search-backward
  bind --erase --preset \eO3B history-token-search-forward
  bind --erase --preset \e\[3A history-token-search-backward
  bind --erase --preset \e\[3B history-token-search-forward
  bind --erase --preset \e\[1\;3A history-token-search-backward
  bind --erase --preset \e\[1\;3B history-token-search-forward
  bind --erase --preset \e\[1\;9A history-token-search-backward
  bind --erase --preset \e\[1\;9B history-token-search-forward
  bind --erase --preset \e. history-token-search-backward
  bind --erase --preset \el __fish_list_current_token
  bind --erase --preset \eo __fish_preview_current_file
  bind --erase --preset \ew __fish_whatis_current_token
  bind --erase --preset \cd delete-or-exit
  bind --erase --preset -k f1 __fish_man_page
  bind --erase --preset \eh __fish_man_page
  bind --erase --preset \ep __fish_paginate
  bind --erase --preset \e\# __fish_toggle_comment_commandline
  bind --erase --preset \ee edit_command_buffer
  bind --erase --preset \ev edit_command_buffer
  bind --erase --preset \e\[I 'emit fish_focus_in'
  bind --erase --preset \e\[O false
  bind --erase --preset \e\[\?1004h false
  bind --erase --preset ' ' self-insert expand-abbr
  bind --erase --preset ';' self-insert expand-abbr
  bind --erase --preset '|' self-insert expand-abbr
  bind --erase --preset '&' self-insert expand-abbr
  bind --erase --preset '>' self-insert expand-abbr
  bind --erase --preset '<' self-insert expand-abbr
  bind --erase --preset ')' self-insert expand-abbr
  bind --erase --preset -k nul 'test -n "$(commandline)" && commandline -i " "'
  bind --erase --preset \e\[32\;2u 'commandline -i " "; commandline -f expand-abbr'
  bind --erase --preset \n execute
  bind --erase --preset \e\[27\;5\;13\~ execute
  bind --erase --preset \e\[13\;5u execute
  bind --erase --preset \e\[27\;2\;13\~ execute
  bind --erase --preset \e\[13\;2u execute
  bind --erase --preset -k dc delete-char
  bind --erase --preset \e\[1\~ beginning-of-line
  bind --erase --preset \e\[4\~ end-of-line
  bind --erase --preset -k home beginning-of-line
  bind --erase --preset -k end end-of-line
  bind --erase --preset \ca beginning-of-line
  bind --erase --preset \ce end-of-line
  bind --erase --preset \b backward-delete-char
  bind --erase --preset \cp up-or-search
  bind --erase --preset \cn down-or-search
  bind --erase --preset \cf forward-char
  bind --erase --preset \cb backward-char
  bind --erase --preset \ct transpose-chars
  bind --erase --preset \cg cancel
  bind --erase --preset \x1f undo
  bind --erase --preset \cz undo
  bind --erase --preset \e/ redo
  bind --erase --preset \et transpose-words
  bind --erase --preset \eu upcase-word
  bind --erase --preset \ec capitalize-word
  bind --erase --preset \e\x7f backward-kill-word
  bind --erase --preset \e\b backward-kill-word
  bind --erase --preset \eb backward-word
  bind --erase --preset \ef forward-word
  bind --erase --preset \e\< beginning-of-buffer
  bind --erase --preset \e\> end-of-buffer
  bind --erase --preset \cr history-pager
  bind --erase --preset \e cancel
  bind --erase --preset \cc
  bind --erase --preset \cw
  bind --erase --preset \es 'for cmd in sudo doas please; if command -q $cmd; fish_commandline_prepend $cmd; break; end; end'


  # do not erase these binds essential to the shell

  # these make pasting work in fish shell
  # bind --erase --preset -m paste \e\[200\~ __fish_start_bracketed_paste
  # bind --erase --preset -M paste \e\[201\~ __fish_stop_bracketed_paste
  # bind --erase --preset -M paste '' self-insert
  # bind --erase --preset -M paste \r commandline\ -i\ \\n
  # bind --erase --preset -M paste \' __fish_commandline_insert_escaped\ \\\'\ \$__fish_paste_quoted
  # bind --erase --preset -M paste \\ __fish_commandline_insert_escaped\ \\\\\ \$__fish_paste_quoted
  # bind --erase --preset -M paste ' ' self-insert-notfirst
  # bind --erase --preset \e\ ep fish_clipboard_paste
  # bind --erase --preset \cv fish_clipboard_paste


  # move curosr back and forth by a word (ctrl + arrow)
  # bind --erase --preset \e\[1\;5C forward-word
  # bind --erase --preset \e\[1\;5D backward-word

  # to move cursor forward and backward
  # bind --erase --preset \e\[C forward-char
  # bind --erase --preset \e\[D backward-char

  # to type chars into the terminal
  # bind --erase --preset '' self-insert

  # to execute the command with enter
  # bind --erase --preset \r execute

  # to delete chars
  # bind --erase --preset -k backspace backward-delete-char

  # to go up and down comamnds history
  # bind --erase --preset \e\[A up-or-search
  # bind --erase --preset \e\[B down-or-search


  # alt + arrow -> move word, go for when i miss type
  # bind --erase --preset \e\[1\;3C nextd-or-forward-word
  # bind --erase --preset \e\[1\;3D prevd-or-backward-word

  # to move to front an back of the line with home and end
  # bind --erase --preset \e\[F end-of-line
  # bind --erase --preset \e\[H beginning-of-line

  # autocompletes
  # bind --preset \t complete


  #my custom keybinds


  bind   \cs 'for cmd in sudo doas please; if command -q $cmd; fish_commandline_prepend $cmd; break; end; end'
  bind   \ca  'commandline "call_ls"; commandline -f execute'
  bind   \cc  clear-screen
  
  
  bind   \cp  backward-kill-path-component
  
  bind   \cd  backward-kill-word
  bind   \cf  kill-word
  
  bind   \cz  backward-kill-line
  bind   \cx  kill-line
  bind   \c_  kill-whole-line
end


function call_ls 
  l
end

set -x XMODIFIERS "@im-fcitx"
set -x GTK_IM_MODULE "@im-fcitx"
set -x QT_IM_MODULE "fcitx"
set -x DefaultIMModule "fcitx"

# install keychain, openssh, ssh-agent, ssh-add
set output (keychain --quiet --eval --agents ssh ~/.ssh/github)
set output (string replace ' export SSH_AUTH_SOCK;' '' $output)
set output (string replace 'SSH_AUTH_SOCK=' 'set -x SSH_AUTH_SOCK ' $output)
set output (string replace ' export SSH_AGENT_PID;' '' $output)
set output (string replace 'SSH_AGENT_PID=' 'set -x SSH_AGENT_PID ' $output)
# echo "$output"
eval "$output"

# haskell 
set -x PATH $PATH ~/.ghcup/bin
set -x PATH $PATH ~/.cabal/bin

