#!/bin/sh

rm -rf sphinx-php symfony-docs-ja
git clone git@github.com:fabpot/sphinx-php.git
git clone git@github.com:symfony-japan/symfony-docs-ja.git

cd sphinx-php
python setup.py install

cd ../symfony-docs-ja
git clone git@github.com:symfony-japan/Create-Your-Framework-ja.git create-your-framework
git clone git@github.com:symfony-japan/sf2-blog-tutorial-doc-ja.git sf2-blog-tutorial
git clone git@github.com:iteman/osc2011-nagoya-symfony2-tutorial.git

# useless en ver.
#cd ../temp
#make html

# ja ver.
cd ../tempja
cp -R ../symfony-docs-ja/* source/

# change doc links
sed -e "s/:hidden:/:maxdepth: 1/" -i "" source/create-your-framework/index.rst

find ./source/create-your-framework -name "part*.rst" | xargs sed -e "s|http://docs.symfony.gr.jp/symfony2/create-your-framework/|./|g" -i ""
find ./source/create-your-framework -name "part*.rst" | xargs sed -e "s|http://docs.symfony.gr.jp/symfony2/|../|g" -i ""
#find ./source/create-your-framework -name "part*.rst" | xargs sed -e "s|http://symfony.com/doc/current/|../|g" -i ""
#find ./source/create-your-framework -name "part*.rst" | xargs sed -e "s|http://symfony.com/doc|../index.html|g" -i ""
find ./source/create-your-framework -name "part*.rst" | xargs sed -e "s|http://fr.php.net/|http://php.net/|g" -i ""

find ./source/osc2011-nagoya-symfony2-tutorial -maxdepth 1 -name "*.rst" | xargs sed -e "s|http://docs.symfony.gr.jp/symfony2/|../|g" -i ""
#find ./source/osc2011-nagoya-symfony2-tutorial -maxdepth 1 -name "part*.rst" | xargs sed -e "s|http://symfony.com/doc/2.0/|../|g" -i ""

find ./source/sf2-blog-tutorial -maxdepth 1 -name "*.rst" | xargs sed -e "s|http://docs.symfony.gr.jp/symfony2/|../|g" -i ""
#find ./source/sf2-blog-tutorial -maxdepth 1 -name "*.rst" | xargs sed -e "s|http://symfony.com/doc/current/|../|g" -i ""
find ./source/sf2-blog-tutorial/customize -maxdepth 1 -name "*.rst" | xargs sed -e "s|http://docs.symfony.gr.jp/symfony2/|../../|g" -i ""
#find ./source/sf2-blog-tutorial/customize -maxdepth 1 -name "*.rst" | xargs sed -e "s|http://symfony.com/doc/current/|../../|g" -i ""

make doc

