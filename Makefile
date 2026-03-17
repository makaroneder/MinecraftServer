VERSION ?= 1.20.1-47.4.16
SERVERDIR ?= server
INSTALLERDIR = installer
INSTALLER ?= forge-$(VERSION)-installer.jar

run:
	@cd $(SERVERDIR) && ./run.sh
init:
	@cp $(INSTALLERDIR)/$(INSTALLER) $(SERVERDIR)/
	@cd $(SERVERDIR) && java -jar $(INSTALLER) --installServer
	@cd $(SERVERDIR) && ./run.sh || true
	@echo "eula=true" > $(SERVERDIR)/eula.txt
clean:
	@rm -rf $(SERVERDIR)/*
.PHONY: run init clean
