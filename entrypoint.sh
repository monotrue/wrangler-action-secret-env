#!/bin/sh

set -e

export HOME="/github/workspace"
export NVM_DIR="/github/workspace/nvm"
export WRANGLER_HOME="/github/workspace"
export PATH="$HOME/.cargo/bin:$PATH"

export $(grep -v '^#' secret.env | xargs)

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

mkdir -p "$HOME/.wrangler"
chmod -R 770 "$HOME/.wrangler"



cd $HOME

npm i -g @cloudflare/wrangler 
npm i -D wasm-pack-npm 
npm i 
npm install babel-core babel-loader babel-preset-es2015 --save-dev
npm i -D babel babel-cli inquirer eslint --save-dev 

npm i -g webpack 
npm i -D webpack-cli 
npm i -D workbox-cli --save-dev
npm i -g @webpack-cli/init 



wrangler whoami

webpack -v
