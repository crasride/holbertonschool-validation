build:
	hugo -s -d dist/

clean:
	rm -r dist/*

post:
	hugo new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md
# Overwrite the content of a text file without generating a new one (option -i)
