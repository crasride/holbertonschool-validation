build:
	hugo

clean:
	rm -r dist/*

post:
	hugo new posts/$(POST_NAME).md
# Overwrite the content of a text file 
	echo '# $(POST_TITLE)' >> ./content/posts/$(POST_NAME).md
