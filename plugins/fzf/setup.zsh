# Smart fzf binary installation (Self-healing)
if [[ ! -x "${XDG_BIN_HOME:-${HOME}/.local/bin:-${HOME}/.bin}/fzf" ]]; then
  # Senior Check: System dependencies verification
  for tool in curl jq tar mktemp; do
    if ! (( $+commands[$tool] )); then
      echo "[fzf-installer] Error: '$tool' is required but not installed. Skipping FZF setup."
      return 1
    fi
  done

  echo "FZF binary is missing. Installing latest version..."
  
  local arch=$(uname -m)
  local arch_target="linux_amd64"
  [[ "$arch" == "aarch64" || "$arch" == "arm64" ]] && arch_target="linux_arm64"
  
  local latest_ver=$(curl -s https://api.github.com/repos/junegunn/fzf/releases/latest | jq -r .name)
  local download_url="https://github.com/junegunn/fzf/releases/latest/download/fzf-${latest_ver}-${arch_target}.tar.gz"
  
  # Professional temporary file management
  local tmp_dir=$(mktemp -d)
  local tmp_archive="${tmp_dir}/fzf.tar.gz"
  
  # Minimalist cleanup on exit or error
  # trap "rm -rf '$tmp_dir'" EXIT  # (Optionnel si on veut forcer le cleanup au niveau process)

  mkdir -p "${XDG_BIN_HOME}"
  
  if curl -fsSL "$download_url" -o "$tmp_archive"; then
    tar -xzf "$tmp_archive" -C "${XDG_BIN_HOME}" fzf
    chmod +x "${XDG_BIN_HOME}/fzf"
    echo "FZF (${arch_target}) version ${latest_ver} successfully installed in ${XDG_BIN_HOME}."
  else
    echo "Error: Failed to download FZF from $download_url"
  fi

  # Final cleanup
  rm -rf "$tmp_dir"
fi
