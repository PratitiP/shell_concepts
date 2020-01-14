git filter-branch -f --env-filter "
	GIT_AUTHOR_NAME='Pratiti'
	GIT_AUTHOR_EMAIL='pratitipshah@gmail.com'
	GIT_COMMITTER_NAME='pratiti'
	GIT_COMMITTER_EMAIL='pratitipshah@gmail.com'
" HEAD
