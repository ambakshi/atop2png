.PHONY: all clean
.PRECIOUS: %.cpl %.swp

PNGS = reznov-cpl.png reznov-swp.png

all: $(PNGS)

clean:
	rm -f $(PNGS) *.cpl *.swp

%.cpl: %.log
	atop -PCPL -r $< > $@.tmp && mv $@.tmp $@

%.swp: %.log
	atop -PSWP -r $< > $@.tmp && mv $@.tmp $@


%-cpl.png: %.cpl
	bin/cpl2png.sh $< $* $@


%-swp.png: %.swp
	bin/swp2png.sh $< $* $@


