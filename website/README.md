# Website (Astro - Startlight)

This folder contains a small Astro site (Startlight-inspired) for the repository. It is intended to be published to GitHub Pages via CI.

Note: this site uses Astro v5.15 and requires Node 18+ to run locally.

Quick commands:

```bash
cd website
npm install
npm run dev    # local dev
npm run build  # generate dist/
npm run preview
```

Update `astro.config.mjs` site value to match your GitHub Pages host URL, for example:

```js
site: 'https://<USERNAME>.github.io/min-android-app-template'
```

## Features

- Small Startlight-inspired theme (dark, readable, fast)
- Minimal pages: Home, About, Install, Releases
- Auto-deploy to GitHub Pages via CI workflow in `.github/workflows/deploy-website.yml`. Note: the site is published only when a GitHub Release is published (or you run the workflow manually).

## Install / Build (Android project)

For app install/build instructions see `/install` in the website or follow these quick commands from the repo root:

```bash
git clone https://github.com/cmwen/min-android-app-template.git
cd min-android-app-template
# debug build
./gradlew assembleDebug
# release build (requires keystore env vars)
./gradlew assembleRelease
```

## Download / Releases

Prebuilt artifacts and APKs (if available) will be posted to GitHub Releases. You can view or download the latest release at:

https://github.com/cmwen/min-android-app-template/releases/latest

