MAKEFLAGS += --no-builtin-rules
.SUFFIXES:

.PHONY: default
.PHONY: images css files fonts scp-test legacy
.PHONY: clean
.PHONY: rebuildcss

# Default rule
default: images css files fonts scp-test legacy

# Sub-makefiles included
include build/meta.mk
include build/css.mk
include build/images.mk
include build/files.mk
include build/fonts.mk
include build/legacy.mk
include build/scp-test.mk

# Top-level rules
css: dist/css/min/ dist/css/parts/ dist/css/parts/int/ $(CSS_COPY_OUTPUTS) $(CSS_OUTPUTS)
images: dist/img/ $(IMAGE_COPY_OUTPUTS) $(IMAGE_OPTIMIZE_OUTPUTS)
files: $(FILES_OUTPUTS)
fonts: dist/fonts/ $(FONTS_COPY_OUTPUTS)
scp-test: $(SCP_TEST_OUTPUTS)
legacy: dist/stable/styles/ $(LEGACY_CSS_OUTPUTS)

# Utility rules
clean:
	rm -rf dist

rebuildcss:
	rm -rf dist/css && make css
