#!/bin/bash

set -euo pipefail

if ! command -v stow >/dev/null 2>&1; then
  echo "Error: 'stow' no esta instalado."

  case "$(uname -s)" in
    Darwin)
      echo "Instalalo en macOS con: brew install stow"
      ;;
    Linux)
      if command -v apt-get >/dev/null 2>&1; then
        echo "Instalalo con: sudo apt-get update && sudo apt-get install -y stow"
      elif command -v dnf >/dev/null 2>&1; then
        echo "Instalalo con: sudo dnf install -y stow"
      elif command -v pacman >/dev/null 2>&1; then
        echo "Instalalo con: sudo pacman -S --noconfirm stow"
      elif command -v zypper >/dev/null 2>&1; then
        echo "Instalalo con: sudo zypper install -y stow"
      else
        echo "Instala 'stow' con el gestor de paquetes de tu distro."
      fi
      ;;
    *)
      echo "Sistema no soportado automaticamente. Instala 'stow' manualmente."
      ;;
  esac

  exit 1
fi

# Dirs to exclude from stow
exclude_dirs=(
  # "scripts"
  # "docs"
)

packages=()

for dir in */; do
  pkg="${dir%/}"

  # Ignore hidden directories and files
  [[ "$pkg" == .* ]] && continue

  skip=false
  if ((${#exclude_dirs[@]} > 0)); then
    for ex in "${exclude_dirs[@]}"; do
      if [[ "$pkg" == "$ex" ]]; then
        skip=true
        break
      fi
    done
  fi
  $skip && continue

  packages+=("$pkg")
done

if ((${#packages[@]} == 0)); then
  echo "No packages found to stow. Nothing to do :("
  exit 1
fi

echo "Applying stow for packages: ${packages[*]}"
stow -t "$HOME" "${packages[@]}"
echo "Ready! :)"
