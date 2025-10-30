path=(
  $HOME/bin
  $HOME/.local/bin
  /usr/local/bin
  $path
)

# Go
export GOPATH="$HOME/go"
path+=(
  $GOPATH/bin
  /usr/local/go/bin
)

if [[ "$OSTYPE" == "darwin"* ]]; then
  path+=(
    /opt/homebrew/bin
    /opt/homebrew/sbin
    /opt/homebrew/opt/python@3.8/libexec/bin
    /opt/homebrew/opt/openssl@3/lib/pkgconfig
  )
  export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
  export NODE_OPTIONS=--openssl-legacy-provider
  export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  export DOCKER_HOST="unix:///run/user/1000/podman/podman.sock"
  alias docker='podman'
  alias blue-start='systemctl start bluetooth.service'
  alias blue-stop='systemctl stop bluetooth.service'
fi

export PATH
