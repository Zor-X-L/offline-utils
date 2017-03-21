NAME = poco
VER = 1.7.8

.PHONY: download install clean distclean

download:
	wget -N https://pocoproject.org/releases/poco-1.7.8/$(NAME)-$(VER).tar.gz

install:
	tar -xf $(NAME)-$(VER).tar.gz
	cd $(NAME)-$(VER) && \
		./configure --prefix=$(PREFIX) --static --shared
	$(MAKE) -C $(NAME)-$(VER)
	$(MAKE) -C $(NAME)-$(VER) install

clean:
	rm -rf $(NAME)-$(VER)

distclean: clean
	rm -f $(NAME)-$(VER).tar.gz
