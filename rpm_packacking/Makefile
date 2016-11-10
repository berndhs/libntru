
# Makefile for generating RPM for anything
#


NAME = $(shell cat pack-name)
VERSION = $(shell cat pack-version)
COUNT = $(shell docount.sh)
ONAME = spot-on

RPMBUILD = $(HOME)/rpmbuild
SOURCEDIR = $(RPMBUILD)/SOURCES
TAR_NAME = $(NAME)-$(VERSION)

TAR_SRC = $(TAR_NAME).tar.gz
SPEC = $(NAME).spec
CHANGES = $(NAME).changes

SRC = $(SOURCEDIR)/$(TAR_SRC)

rpm: ../$(TAR_SRC) $(SPEC) 
	echo "Making rpm for the $(COUNT) time"
	pwd
	cp ../$(TAR_SRC)  ~/rpmbuild/SOURCES/
	rpmbuild -ba $(SPEC)

tar:	FORCE	
		echo "make tar"  ; \
		cd ..; \
		pwd ; \
		cp branches/trunk/*.qt5.pro cp branches/trunk/*.desktop . ; \
		pwd; ls -l ; \
		echo "making $(TAR_SRC) from $(TAR_NAME) files"; \
		makearchive.sh $(TAR_NAME) master;
	

info:
	(  \
	  echo "name      " $(NAME) ; \
	  echo "spec file " $(SPEC) ; \
	  echo "source    " $(SRC) ; \
	  echo "version   " $(VERSION) ; \
	)

spec:	
	make $(SPEC)

$(SPEC):  spec.in pack-version pack-count
	touch spec.old
	if [ -e $(SPEC) ] ;\
	then  \
	  mv $(SPEC) spec.old ; \
	else \
	  touch spec.old ;\
	fi
	echo -n "%define sourceversion " > $(SPEC)
	echo $(VERSION) >> $(SPEC)
	echo -n "%define relcount " >> $(SPEC)
	echo $(COUNT) >> $(SPEC)
	cat spec.in >> $(SPEC)
	cat $(CHANGES) >> $(SPEC)
	-diff spec.old $(SPEC)
	ls -l $(SPEC)

$(SOURCEDIR)/$(TAR_SRC): $(TAR_SRC)
	cp $(TAR_SRC) $(SOURCEDIR)/$(TAR_SRC)

$(SOURCEDIR)/$(DT_SRC): $(DT_SRC)
	cp $(DT_SRC) $(SOURCEDIR)/$(DT_SRC)

FORCE:
	

