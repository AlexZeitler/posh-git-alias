function unresolve() {
	git checkout --conflict=merge --
}

# temporarily ignoring files
function ignore() {
	git update-index --assume-unchanged
}

function unignore() {
	git update-index --no-assume-unchanged
}

function ignored() {
	git ls-files -v | env --unset=GREP_OPTIONS grep --perl '^[a-z] '
}

function gitignored() {
	git ls-files --others --directory --ignored --exclude-standard
}

# git commit
function commit() {
	git commit --verbose
}

function amend() {
	git commit --verbose --amend --reuse-message=HEAD
}

function ci() {
	git commit --verbose
}

function cim() {
	git commit --verbose --message $args[0]
}

function cima() {
	git commit --verbose --all --message
}

function ca() {
	git commit --verbose --all
}

function co() {
	git checkout
}

# git branch and remote
function b() {
	git branch
}

function bc() {
	git checkout -b
}

function brs() {
	git branch -a --verbose
}

function rv() {
	git remote -v
}

function pru() {
	git fetch upstream 
	git rebase upstream/master
}

function pro() {
	git fetch origin
	git rebase origin/master
}

function mpull() {
	git branch=${1:-develop}
	git fetch origin
	git rebase --preserve-merges origin/$branch $branch
}

function pub()  {
	git publish
}

# git add
function a() {
	git add
}

function au() {
	git add --update
}

function aa() {
	git add --all
}

function ai() {
	git add --interactive
}

function ap() {
	git add --patch
}

function aaa() {
	git add --all
	git commit --verbose --amend --reuse-message=HEAD
}

function aua() {
	git add --update
	git commit --verbose --amend --reuse-message=HEAD
}

# git checkout

function c() {
	git checkout $args[0]
}

function cp() {
	git checkout --patch
}

function rp() {
	git reset --patch
}

# git fetch
function f() {
	git fetch
}

# git rebase
function r() {
	git rebase --interactive
}

function rc() {
	git rebase --continue
}

function ra() {
	git rebase --abort
}

# git diff
function d() {
	git diff
}

function p()  {
	git diff --cached
}

function dc() {
	git diff --cached
}

function wd() {
	git diff --word-diff
}

function wdc() {
	git diff --cached --word-diff
}

function dt() {
	git difftool
}

function dtc() {
	git difftool --cached
}

function dtp() {
	git difftool --tool=p4
}

function dtcp() {
	git difftool --cached --tool=p4
}

function mt() {
	git mergetool
}

function mtp() {
	git mergetool --tool=p4
}

# git status
function s() {
	git status
}

# git push
function pu() {
	git push upstream
}

function puf() {
	git push upstream --force
}

function po() {
	git push origin $args[0]
}

function pof() {
	git push origin --force
}

# git log
function l1() {
	git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %b %Cgreen(%cd) %C(bold blue)<%an>%Creset" --abbrev-commit
}

function l2() {
	git log --pretty=oneline --abbrev-commit --max-count=15 --decorate
}

function ll() {
	git log --graph --date-order -C -M --pretty=format:"<%h> %ad [%an] %Cgreen%d%Creset %s" --date=short
}

function lx() {
	git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %Cgreen(%cd) %C(bold blue) %an [%ae]:%Creset %n %s %n %b %n" --abbrev-commit
}

function gl() {
	git glog
}

function wdw() {
	git log --pretty="format:%an - %s"
}

function l() {
	git log --graph --date-order -C -M --pretty=format:"<%h> %ad [%an] %Cgreen%d%Creset %s" --all --date=short --max-count=15
}

function gf() {
	git log -m -S
}

function glb() {
	git log
}

function glbnm() {
	git log --no-merges
}

# misc
function pick() {
	git cherry-pick
}

function mcp() {
	git multi-cherry-pick
}

function unstage() {
	git reset HEAD
}

function reword() {
	git commit --amend
}

function cleanf() {
	git clean -xdf
}

function review-files() {
	git log --name-only --max-count=1
}
