MINRAM ?= 3G
MAXRAM ?= 4G
VERSION ?= 1.21.11-61.1.3
SERVERDIR ?= server
INSTALLERDIR = installer
FILE ?= forge-$(VERSION)-shim.jar
INSTALLER ?= forge-$(VERSION)-installer.jar

run:
	@cd $(SERVERDIR) && java -Xms$(MINRAM) -Xmx$(MAXRAM) -jar $(FILE) nogui
init:
	@cp $(INSTALLERDIR)/$(INSTALLER) $(SERVERDIR)/
	@cd $(SERVERDIR) && java -jar $(INSTALLER) --installServer
	@echo "eula=true" > $(SERVERDIR)/eula.txt
clean:
	@rm -rf $(SERVERDIR)/*
.PHONY: run init clean
