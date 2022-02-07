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
  git commit -m "Release $version"
  git push origin "$branch"
else
  echo "No changes to commit";
fi
