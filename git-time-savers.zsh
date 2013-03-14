# Git Time Savers #

alias gph='git push heroku master'
alias gbva='git branch -va'
alias gfu='git fetch upstream'
alias gmu='git merge --no-ff upstream/master'

## Resets Hard
gifu(){
	branch=$(git rev-parse --abbrev-ref HEAD);
	git fetch origin;
	git reset --hard origin/$branch;
	print -P "%F{$colorSuccess}=> Git I Fucked Up, reseted your branch%f"
}

## Open gihub project and opens gihub issues page ##
gop(){
	#url=$(git remote -v | perl -n -e 'm{:(.+?).git} && print $1,"\n"' | uniq );
	#open "http://github.com/$url"
	open `git remote -v | sed 's/^.*:/http:\/\/github.com\//' | sed 's/.git .*//' | head -1`
}
gip(){
	url=$(git remote -v | perl -n -e 'm{:(.+?).git} && print $1,"\n"' | uniq );
	open "http://github.com/$url/issues"
}


## Cycles trough all git repos in a dir
gsta(){
	for gitdir in `find ./ -name .git`; 
    do 
        workdir=${gitdir%/*}; 
        echo; 
        echo $workdir; 
        git --git-dir=$gitdir --work-tree=$workdir status; 
    done
}