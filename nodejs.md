---
layout: page
title: Node JS
permalink: /node/
resource: true
---
Node.js (Node) is an open-source, cross-platform JavaScript runtime environment that executes JavaScript code outside of a web browser. Built on Chrome's V8 engine, it allows developers to use JavaScript for server-side scripting and command-line tools, unifying web application development with a single language.


# Installation

Article: https://medium.com/@muesingb/how-to-install-update-node-js-on-macos-using-homebrew-22fc921312c9

What version installed:

```
$ node -v
v16.19.0
```

For updating Node.js, you will need to use Node Version Manager (NVM). To check what version of NVM you have:

$ nvm -v
-bash: nvm: command not found

$ brew install nvm

# Configure nvm

mkdir ~/.nvm

vi .bash_profile

Add the following to .bash_profile:

  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

$ source .bash_profile 
$ nvm -v
0.40.1

# Upgrade Node.js

Use `nvm install node` to upgrade node to the latest version:

```
$ node -v
v16.19.0
$ nvm install node
Downloading and installing node v23.8.0...
Downloading https://nodejs.org/dist/v23.8.0/node-v23.8.0-darwin-x64.tar.xz...
##################################################################################################################################################### 100.0%
Computing checksum with sha256sum
Checksums matched!
Now using node v23.8.0 (npm v10.9.2)
Creating default alias: default -> node (-> v23.8.0)
gmcmilla@gmcmilla-mn1 ~> $ 
gmcmilla@gmcmilla-mn1 ~> $ node -v
v23.8.0
```

# Yarn install

Yarn is a package manager for the Node. js JavaScript runtime. It's an alternative to Node's standard package manager, npm. See https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable

Install yarn:

```
$ npm install --global yarn

added 1 package in 8s
gmcmilla@gmcmilla-mn1 ~/kb> $ yarn --version
1.22.22
```

Run `yarn install` and ensure a `yarn.lock` file was generated at the root:

```
$ yarn install
yarn install v1.22.22
[1/5] 🔍  Validating package.json...
[2/5] 🔍  Resolving packages...
success Already up-to-date.
✨  Done in 0.37s.
```


# Resources

try this http://www.sitepoint.com/using-node-mysql-javascript-client/


http://www.thegeekstuff.com/2014/01/mysql-nodejs-intro/
https://codeforgeek.com/2015/01/nodejs-mysql-tutorial/
https://www.codementor.io/nodejs/tutorial/node-js-mysql
https://medium.com/@muesingb/how-to-install-update-node-js-on-macos-using-homebrew-22fc921312c9
