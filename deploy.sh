#!/bin/bash
set -ev # exit with nonzero exit code if anything fails

# clear the output directory
rm -rf out || exit 0;

# build the blog files + install pygments for highlighting support
npm install
npm run build
pip install pygments
raco frog --build


cd out

git init .
git add .
git commit -m "Post to GH"

git push --force git@github.com:edipofederle/edipofederle.github.io.git master:master
