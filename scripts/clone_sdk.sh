#!/usr/bin/env bash

eval "$(ssh-agent -s)"
tmpdir=$(mktemp -d)

echo "${KNOWN_HOSTS}" > "${tmpdir:?}/known_hosts"

ssh-add - <<< "${SSH_KEY}"; git clone --depth 1 -b main --single-branch "git@github.com:${GITHUB_ORG_ID}/${GITHUB_REPO_ID}.git" "${SDK_PATH:?}"
