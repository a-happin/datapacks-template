OUTDIR=./build
DATAPACKS=datapack
TARGETS=$(addprefix $(OUTDIR)/,$(addsuffix .zip,$(DATAPACKS)))

all: $(TARGETS)

$(TARGETS): $(OUTDIR)/%.zip : | %
	mkdir -p $(OUTDIR)
	(cd $*; zip -r ../$@ *)

clean:
	rm -rfv $(OUTDIR)

.PHONY: all clean
