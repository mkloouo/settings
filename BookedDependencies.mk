
.PHONY: install install-all \
	install-xml-xslt-libs \
	install-curl-lib \
	install-migsql \
	install-cgicc \
	install-fcgi \
	install-ftplib \
	install-openssl \
	install-memcached \
	install-sphinx-client \
	install-hiredis \
	install-clang \
	install-distcc \
	install-gen

install: install-all
install-all: install-xml-xslt-libs \
	install-curl-lib \
	install-migsql \
	install-cgicc \
	install-fcgi \
	install-ftplib \
	install-openssl \
	install-memcached \
	install-sphinx-client \
	install-hiredis \
	install-clang \
	install-distcc \
	install-gen

INSTALL_PACKAGE		:= yaourt --noconfirm -S
CLONE_FROM_FABRICA	= git clone ssh://stash.fabrica.net.ua:7999/$(1)/$(2).git

XML_LIB			:= libxml2
XSLT_LIB		:= libxslt
install-xml-xslt-libs:
	@$(INSTALL_PACKAGE) $(XSLT_LIB) $(XML_LIB)
	@echo 'Installed xml and xslt (exslt).'

CURL_LIB		:= libcurl-compat
install-curl-lib:
	@$(INSTALL_PACKAGE) $(CURL_LIB)
	@echo 'Installed Curl.'

MIGSQL_DIR		:= migsql
$(MIGSQL_DIR):
	@$(call CLONE_FROM_FABRICA,wts,$@)

install-migsql: $(MIGSQL_DIR)
	@cd $< && sh bootstrap
	@cd $< && sh runConfigure
	@sudo make -C $< install
	@echo 'Installed migsql.'

CGICC_DIR		:= cgicc
$(CGICC_DIR):
	@$(call CLONE_FROM_FABRICA,wts,$@)

install-cgicc: $(CGICC_DIR)
	@cd $< && sh bootstrap
	@cd $< && sh runConfigure.freebsd
	@sudo make -C $< install
	@echo 'Installed Cgicc.'

FCGI_LIB		:= fcgi
install-fcgi:
	@$(INSTALL_PACKAGE) $(FCGI_LIB)
	@echo 'Installed Fcgi.'

FTPLIB_DIR		:= ftplib-4.0-1
FTPLIB_TAR		:= $(FTPLIB_DIR).tar.gz
$(FTPLIB_DIR):
	@curl http://nbpfaus.net/~pfau/ftplib/$(FTPLIB_TAR) -o $(FTPLIB_TAR)
	@tar -zxvf $(FTPLIB_TAR)
	@rm -f $(FTPLIB_TAR)

install-ftplib: $(FTPLIB_DIR)
	@sudo make -C $</src install
	@echo 'Installed ftplib.'

OPENSSL_LIB		:= openssl
install-openssl:
	@$(INSTALL_PACKAGE) $(OPENSSL_LIB)
	@echo 'Installed OpenSSL.'

MEMCACHED_LIB		:= libmemcached
install-memcached:
	@$(INSTALL_PACKAGE) $(MEMCACHED_LIB)
	@echo 'Installed MemCached.'

SPHINX_CLIENT_DIR	:= sphinxclientpp
SPHINX_CLIENT_LIB	:= libsphinxclient
$(SPHINX_CLIENT_DIR):
	@$(call CLONE_FROM_FABRICA,wts,$@)

CPP_LOCATION		:= $(shell which cpp)

install-sphinx-client: $(SPHINX_CLIENT_DIR)
	@sudo ln -sf $(CPP_LOCATION) /lib/cpp
	@cd $</$(SPHINX_CLIENT_LIB) && sh configure
	@sudo make -C $</$(SPHINX_CLIENT_LIB) install
	@cd $< && sh bootstrap.sh
	@cd $< && sh configure
	@sudo make -C $< install
	@echo 'Install sphinx-client.'

HIREDIS_LIB		:= hiredis
install-hiredis:
	@$(INSTALL_PACKAGE) $(HIREDIS_LIB)
	@echo 'Install Hiredis.'

CLANG_PKG		:= clang
install-clang:
	@$(INSTALL_PACKAGE) $(CLANG_PKG)
	@echo 'Installed clang. (clang-tidy dependency)'

DISTCC_PKG		:= distcc
install-distcc:
	@$(INSTALL_PACKAGE) $(DISTCC_PKG)

GEN_DIR			:= gen
$(GEN_DIR):
	@$(call CLONE_FROM_FABRICA,wts,$@)

install-gen: $(GEN_DIR)
	@sudo cp -r $< /usr/local/gen++v3

clean:
	@sudo rm -rf $(MIGSQL_DIR)
	@sudo rm -rf $(CGICC_DIR)
	@sudo rm -rf $(FTPLIB_DIR)
	@sudo rm -rf $(SPHINX_CLIENT_DIR)
	@echo 'Cleaned up.'
