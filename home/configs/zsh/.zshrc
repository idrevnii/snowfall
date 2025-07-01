ZPM_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zpm"
if [[ ! -d "$ZPM_HOME" ]]; then
  git clone https://github.com/zpm-zsh/zpm "$ZPM_HOME"
fi
source "$ZPM_HOME/zpm.zsh"

# --- 2. Плагины ---
# Загружаем плагины с помощью ZPM
zpm load zsh-users/zsh-autosuggestions    # Предлагает команды на основе истории
zpm load zsh-users/zsh-syntax-highlighting # Подсветка синтаксиса команд
zpm load Aloxaf/fzf-tab                   # Мощное автодополнение с помощью fzf

# --- 3. Тема ---
# Используем минималистичную и быструю тему "Pure"
zpm load zpm-zsh/pure

# --- 4. Интеграция с nix-colors ---
# Подключаем цвета, сгенерированные Home Manager
if [[ -f "$HOME/.config/nix-colors/colors.sh" ]]; then
  source "$HOME/.config/nix-colors/colors.sh"
fi

# Настройка темы Pure для использования цветов nix-colors
zstyle ':zpm:zpm-zsh/pure' color:prompt:path "$foreground[blue]"
zstyle ':zpm:zpm-zsh/pure' color:prompt:error "$foreground[red]"
zstyle ':zpm:zpm-zsh/pure' color:prompt:success "$foreground[green]"
zstyle ':zpm:zpm-zsh/pure' color:vcs:branch "$foreground[yellow]"

# --- 5. Интеграция с утилитами ---
# zoxide (умный cd)
eval "$(zoxide init zsh)"

# --- 6. Алиасы и настройки ---
# Основные алиасы
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias cat='bat'
alias grep='rg'
alias cd='z'
alias vim='nvim'

# Алиасы для NixOS
alias update='sudo nixos-rebuild switch --flake ~/nixos#plutonium'
alias gc='sudo nix-collect-garbage -d'

# Редактор
export EDITOR='nvim'