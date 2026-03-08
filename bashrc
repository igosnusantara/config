# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

export LC_COLLATE=C

# 1. Source global definitions (Standar EL10)
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# 2. Prompt Berwarna (User@Host:Path)
# Menampilkan warna hijau untuk user biasa, merah untuk root
if [ -n "$TMUX" ]; then
    # --- PROMPT KHUSUS DI DALAM TMUX ---
    if [ "$EUID" -eq 0 ]; then
        # Prompt Root di Tmux (Warna Merah: 1;31)
        PS1='\[\e[1;31m\]\u\[\e[1;33m\]@\h \[\e[1;35m\]TMUX in \[\e[1;34m\]\w\[\e[0m\] \n# '
    else
        # Prompt User di Tmux (Warna Hijau: 1;32)
        PS1='\[\e[1;32m\]\u\[\e[1;33m\]@\h \[\e[1;35m\]TMUX in \[\e[1;34m\]\w\[\e[0m\] \n$ '
    fi
else
    # --- PROMPT BIASA (DI LUAR TMUX) ---
    if [ "$EUID" -eq 0 ]; then
        # Prompt Root (Warna Merah: 1;31)
        PS1='\[\e[1;31m\]\u\[\e[1;33m\]@\h \[\e[1;35m\]in \[\e[1;34m\]\w\[\e[0m\] # '
    else
        # Prompt User (Warna Hijau: 1;32)
        PS1='\[\e[1;32m\]\u\[\e[1;33m\]@\h \[\e[1;35m\]in \[\e[1;34m\]\w\[\e[0m\] $ '
    fi
fi

# 3. Alias Navigasi & List
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../../'
# alias ll='LC_COLLATE=C ls -la --group-directories-first --color=auto'
alias ll='LC_COLLATE=C ls -lahF --group-directories-first --color=auto --time-style=long-iso'
# Mengurutkan berdasarkan nama (tetap berwarna)
alias llsort='ll --color=always | sort'
# Mengurutkan berdasarkan ukuran file (Human Readable)
alias llsize='ll --color=always | sort -h -k5'
alias llt='ll -tr'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# 4. Alias Keamanan (Mencegah kecelakaan)
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# 5. Informasi Sistem & Resource
alias df='df -h'
alias free='free -m'
alias myip='curl -s https://ifconfig.me && echo'
alias h='history | tail -20'

# 6. Shortcut DNF (Sangat berguna di EL10)
alias update='sudo dnf update'
alias install='sudo dnf install'
alias search='dnf search'

# 7. Fastfech
alias fastfetch='fastfetch --logo /usr/share/ign-config/ign-fastfetch.txt'

# 8. ign-config-update
alias ign-config-update='curl -L s.id/ignconfig | bash'

# 9. Fungsi Tambahan: Ekstrak segala jenis file    
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

