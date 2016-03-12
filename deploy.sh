echo "Generating Website"
hugo
echo "Cleaning"
find ../../yknx4.github.io/. -type f -maxdepth 1 ! -name .git -delete
echo "Copying public files"
cp -R public/. ../../yknx4.github.io/
cd ../../yknx4.github.io/
git checkout master
echo "Adding to git"
# Add changes to git.
git add -A
echo "Commiting to git"
# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
# Push source and build repos.
echo "Pushing to Github Pages"
git push origin master
cd ../yknx4/landing-generator/
