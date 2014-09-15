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
make doc

