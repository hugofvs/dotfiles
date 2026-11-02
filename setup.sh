#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"
packages=(ghostty zsh nushell starship atuin)
backup=false
if [[ "${1:-}" == --backup ]]; then
    backup=true
    shift
fi
if (( $# )); then
    packages=("$@")
fi
for package in "${packages[@]}"; do
    case "$package" in
        ghostty|zsh|nushell|starship|atuin) ;;
        *) echo "Unknown package: $package" >&2; exit 1 ;;
    esac
done

if "$backup"; then
    targets=()
    for package in "${packages[@]}"; do
        while IFS= read -r -d '' source; do
            target="$HOME/${source#"$package/"}"
            # A folded Stow directory link makes its children look like regular
            # files. Never move a target that is already the source file.
            if [[ "$source" -ef "$target" ]]; then
                continue
            fi
            # Do not move files through unrelated directory links either.
            parent=$(dirname "$target")
            while [[ "$parent" != "$HOME" && "$parent" != / ]]; do
                if [[ -L "$parent" ]]; then
                    printf 'Refusing to back up through directory symlink: %s\n' "$parent" >&2
                    exit 1
                fi
                parent=$(dirname "$parent")
            done
            if [[ -f "$target" && ! -L "$target" ]]; then
                targets+=("$target")
            fi
        done < <(find "$package" -type f ! -name '*.backup.*' -print0)
    done
    for target in ${targets[@]+"${targets[@]}"}; do
        # mktemp reserves a unique name beside the original file.
        saved=$(mktemp "${target}.backup.XXXXXX")
        mv "$target" "$saved"
        printf 'Backed up %s to %s\n' "$target" "$saved"
    done
fi

# Check every package before creating any links.
stow --ignore='\.backup\.' --simulate -t "$HOME" "${packages[@]}"
stow --ignore='\.backup\.' -t "$HOME" "${packages[@]}"
