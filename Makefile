ignore:
	@gibo dump core vagrant ansible > .gitignore
	@sed -i 's@# \*\.log@*.log@g' .gitignore
