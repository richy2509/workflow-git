#!/usr/bin/env bash

init_branch(){
	git checkout -b ${1}
}

push_upstream(){
	git push --set-upstream origin ${1}
}

switch_branch(){
	git checkout ${1}
}

merge_feature(){
	git checkout develop
	git merge ${1}
}

merge_branch(){
	git merge ${1}
}

accept_release(){
	git checkout master
	git merge release
}

new_feature(){
	git checkout develop
	git checkout -b $1 
}

create_file(){
	echo "Create ${1}" >> ${1} 
	git add ${1} 
	git commit -m "add file ${1}"
}

update_file(){
	echo "Update ${1}" >> ${1} 
	git add ${1} 
	git commit -m "update file ${1}"
}

add_to_repo(){
	git add ${1}
	git commit -m "add ${1}"
}

delete_branch(){
	git push origin --delete ${1}
	git branch -d ${1}
}

delete_branch develop
delete_branch release
delete_branch hotfix
delete_branch feature1
delete_branch feature2
delete_branch feature3

rm -rf *.txt
rm -rf .git
rm -rf .idea
rm -rf .gitignore
rm -rf README.md
rm -rf git.sh

git init

init_branch master

create_file readme.md

git remote add origin https://github.com/richy2509/workflow-git.git

git push -u --force origin master

add_to_repo launch.sh

create_file .gitignore

init_branch develop
push_upstream develop

create_file develop1.txt

update_file develop1.txt

update_file develop1.txt

create_file develop2.txt

create_file develop3.txt

new_feature feature1

create_file feature1.txt

update_file feature1.txt
push_upstream feature1

switch_branch develop

new_feature feature2

create_file feature2.txt

update_file feature2.txt

update_file feature2.txt

push_upstream develop

switch_branch develop

new_feature feature3

create_file feature3.txt

update_file feature3.txt

update_file feature3.txt

merge_feature feature1

create_file after_merge.txt

init_branch release
push_upstream release

merge_branch develop

accept_release

switch_branch develop

create_file after_release.txt

init_branch hotfix
push_upstream hotfix

create_file hotfix

switch_branch master

merge_branch hotfix

switch_branch develop

merge_branch hotfix

