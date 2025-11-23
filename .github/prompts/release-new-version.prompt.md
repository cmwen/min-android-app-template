---
title: "Release new version — safety-first checklist and workflow trigger"
description: "A safety-first checklist and helper instructions to release a new version. It verifies CI status, validates documentation (website builds), ensures changelog presence, and provides the recommended `gh`-based release helper script: `scripts/release/gh_release.sh`."
model: gpt-5-mini
mode: agent
---

## Release new version — safety-first checklist and workflow trigger

**Purpose:** Help maintainers release a new version safely by verifying CI status, quick documentation checks, and then triggering the repository's release workflow.

Use this prompt with GitHub Copilot, Copilot Chat, or manually when preparing a release.

Key checks (automated helper script available at `scripts/release/gh_release.sh`):

- Confirm the latest build on the target branch (default: `main`) is passing in GitHub Actions.
- Make sure documentation is up-to-date (quick check: website builds successfully and a `CHANGELOG.md` exists).
- Ensure your working tree is clean and you're releasing from the intended branch.
- Optionally run local builds/tests if you prefer stronger guarantees: `./gradlew build` and `npm --prefix website run build`.

Checklist to follow before releasing:

1. Confirm changes are merged to `main` (or whichever branch you use for releases).
2. Confirm GitHub Actions checks for the latest commit are green.
3. Confirm documentation is updated and the website builds locally.
4. Confirm `CHANGELOG.md` (or release notes) include the release notes for this version.
5. Run the helper script to trigger the workflow, or use the `gh` CLI manually:

  - Automated helper (interactive): `scripts/release/gh_release.sh`
  - Manual trigger using GitHub CLI: `gh workflow run release.yml --ref main`

How to use the helper script (recommended):

1. Install GitHub CLI and authenticate: `gh auth login`.
2. Ensure you have node/npm and Gradle available if you want to run the checks locally.
3. Run: `./scripts/release/gh_release.sh` and follow the interactive prompts.

Notes & rationale
- Releasing without CI passing risks publishing broken artifacts. The script checks the latest run status for the chosen branch and refuses to continue if it finds failing or incomplete runs.
- The docs check is lightweight (site build + `CHANGELOG.md` presence). If your project requires stricter validation, extend the helper to check for specific files or updated version numbers.

Security and permissions
- Triggering the workflow requires `workflow` permissions. Use a GitHub account with repo/Actions privileges or a PAT/`gh` auth with the correct scopes.

If you want me to extend the checks (e.g., check for a version bump in `build.gradle.kts`, verify tag creation, or run tests inside a reproducible environment), say which checks you want and I'll add them.
