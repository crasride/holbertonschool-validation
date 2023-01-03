# Define variables
Publish=hugo

build:
	$(Publish)

clean:
	rm -r dist/*

post:
	$(Publish) new posts/$(POST_NAME).md
	echo '# $(POST_TITLE)' >> ./content/posts/$(POST_NAME).md
