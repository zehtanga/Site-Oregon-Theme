SCP_TEST_SOURCES := \
	src/scp-test-page.html \
	src/scp-test-page.js

SCP_TEST_OUTPUTS := \
	dist/scp-test-page.html \
	dist/scp-test-page.js

# Copy and inline-patch files
dist/scp-test-page.html: src/scp-test-page.html
	build/install.sh 644 $< $@

dist/scp-test-page.js: src/scp-test-page.js
	build/install.sh 644 $< $@

