pwd
mkdir test_G
cd test_G
git init
echo "I am commit_G." >> readme_G
git add .
git commit -m"commit_G is here"
git tag G
cd ..

pwd
mkdir test_H
cd test_H
git init
echo "I am commit_H." >> readme_H
git add .
git commit -m"commit_H is here"
git tag H
cd ..

pwd
mkdir test_D
cd test_D
git init
git remote add G ../test_G/
git remote add H ../test_H/
git fetch G
git fetch H
git checkout -b  master  G/master
git merge --allow-unrelated-histories --no-edit H/master
git commit --amend -m"commit_D is here"
git tag D
cd ..

pwd
mkdir test_E
cd test_E
git init
echo "I am commit_E." >> readme_E
git add .
git commit -m"commit_E is here"
git tag E
cd ..

pwd
mkdir test_I
cd test_I
git init
echo "I am commit_I." >> readme_I
git add .
git commit -m"commit_I is here"
git tag I
cd ..

pwd
mkdir test_J
cd test_J
git init
echo "I am commit_J." >> readme_J
git add .
git commit -m"commit_J is here"
git tag J
cd ..

pwd
mkdir test_F
cd test_F
git init
git remote add I ../test_I/
git remote add J ../test_J/
git fetch I
git fetch J
git checkout -b  master  I/master
git merge --allow-unrelated-histories --no-edit J/master
git commit --amend -m"commit_F is here"
git tag F
cd ..

pwd
mkdir test_B
cd test_B
git init
git remote add D ../test_D/
git remote add E ../test_E/
git remote add F ../test_F/
git fetch D
git fetch E
git fetch F
git checkout -b  master  D/master
git merge --allow-unrelated-histories -s ours -m"commit_B is here" E/master F/master
git tag B
cd ..

pwd
git clone test_F/ test_C
cd test_C
echo "I am commit_C." >> readme_C
git add .
git commit -m"commit_C is here"
git tag C
cd ..

pwd
mkdir test_A
cd test_A
git init
git remote add B ../test_B/
git remote add C ../test_C/
git fetch B
git fetch C
git checkout -b  master  B/master
git merge --allow-unrelated-histories -m"commit_A is here" C/master
git tag A
git remote remove B
git remote remove C
