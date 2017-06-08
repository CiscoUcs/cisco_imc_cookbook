help:
	@echo "clean - remove all installed gem file "
	@echo "install - Creates and installs the gem file"
clean:
	gem uninstall ImcSdk

install: clean
		 gem build ImcSdk.gemspec
		 gem install ImcSdk-*.gem