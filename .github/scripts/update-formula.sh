version_pattern="[0-9]+\.[0-9]+\.[0-9]+(-[a-z]+\.[0-9])?"
formula=$1
version=$2
sha=$3
if [ "$version" == '' ] || [ "$sha" == '' ]; then
  exit
fi
#fetch the current version
current_version=$(grep -w "version " Formula/$formula.rb | awk '{print $2}' | tr -d \")
echo "Current version $current_version"
if [ "$version" != "$current_version" ]; then
  cp Formula/$formula.rb Formula/$formula@$current_version.rb
  class_name=$(echo $formula | sed -e "s/\b./\u&/g")AT$(echo $current_version | tr -dc '[:alnum:]\n\r' | sed 's/[[:alpha:]]/\U&/')
  sed -i.bak "s/^class [^ ]*/class $class_name/" Formula/$formula@$current_version.rb
fi
formula_path="Formula/$formula.rb"
sed -E -i.bak "s/twilio-v$version_pattern/twilio-v$version/g" "$formula_path"
sed -i.bak "s/version .*/version \"$version\"/" "$formula_path"
sed -i.bak "s/sha256 .*/sha256 \"$sha\"/" "$formula_path"
echo "Git configurations"
git config --global user.email "team_interfaces+github@twilio.com"
git config --global user.name "twilio-dx"
branch=$(git branch --show-current)
echo "Current branch: $branch"
git add -A
if [ -n "$(git status --porcelain)" ]; then
  echo "There are changes to commit.";
  # Direct pushes to main are rejected by the org-level "Twilio default branch
  # protections" ruleset (GH013: "Changes must be made through a pull
  # request"), so the formula update lands as a PR instead.
  #
  # The PR is not queued for auto-merge: that is disabled on this repo
  # (allow_auto_merge=false), so `gh pr merge --auto` would just fail. It has
  # to be reviewed and merged, and the release is not live in the tap until
  # that happens.
  pr_branch="release-$version-${GITHUB_RUN_ID:-manual}"
  git checkout -b "$pr_branch"
  git commit -m "Release $version"
  git push origin "$pr_branch"

  pr_url=$(gh pr create --base "${BASE_BRANCH:-main}" --head "$pr_branch" \
    --title "Release $version" \
    --body "Updates \`Formula/$formula.rb\` to \`$version\`.

- version: \`$version\`
- sha256: \`$sha\`

Opened by the Homebrew Release workflow.")
  echo "::notice::Formula PR opened for $version: $pr_url"
  echo "Review and merge it to publish $version to the tap."
else
  echo "No changes to commit";
fi
