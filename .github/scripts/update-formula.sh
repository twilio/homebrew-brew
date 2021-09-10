version_pattern="[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*"
formula=$1
version=$2
sha=$3
if [ "$version" == '' || "$sha" == '' ]; then
  exit
fi
formula_path="Formula/$formula.rb"
sed -i.bak "s/$formula-v$version_pattern/$formula-v$version/g" "$formula_path"
sed -i.bak "s/version .*/version $version/" "$formula_path"
sed -i.bak "s/sha256 .*/sha256 $sha/" "$formula_path"
git config --global user.email "lakshmiravali.rimmalapudi@gmail.com"
git config --global user.name "lakshmiravali"
branch=$(git branch --show-current)
echo "Current branch: $branch"
git add -A
git commit -m "Release $version"
git push origin "$branch"
