---
layout: page
title: Docusaurus
permalink: /docusaurus/
resource: true
---

https://docusaurus.io/


# Installation

Article: https://docusaurus.io/docs/installation

```
$ npx create-docusaurus@latest rabbit-hole classic
```

Docusaurus version, as set in `package.json`:

```
$ npx docusaurus --version
3.7.0
```

Don't forget to install Yarn and auto-gen a `yarn.lock` file:

```
$ yarn install
```


# Build and Deploy

Article: https://docusaurus.io/docs/deployment

Use Yarn (not npm) because it scales better and LinkedIn's Docusaurus implementation uses it.

Local build:

```
$ yarn build
```

Local deploy (for previewing on my mac before pushing to production):

```
$ yarn run start
```

# Deploy to GitHub Pages with GitHub Actions

Article: https://docusaurus.io/docs/deployment#deploying-to-github-pages

