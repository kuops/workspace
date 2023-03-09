gitignore:
	@gibo dump core Ansible Vagrant macOS > .gitignore
	@sed -i 's@# \*\.log@*.log@g' .gitignore
