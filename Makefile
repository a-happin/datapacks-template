OUTDIR=./build
DATAPACKS=$(shell fd --hidden --exclude .git --exclude test --max-depth 2 pack.mcmeta --exec-batch printf "%s\n" {//})
TARGETS=$(addprefix $(OUTDIR)/,$(addsuffix .zip,$(DATAPACKS)))

all: $(TARGETS)

$(OUTDIR):
	mkdir -p $@

$(TARGETS): $(OUTDIR)/%.zip : $(OUTDIR) | %
	(cd $*; zip -r ../$@ *)

clean:
	rm -rfv $(OUTDIR)

.PHONY: all clean
