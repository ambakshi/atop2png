.PHONY: all clean
.PRECIOUS: %.cpl %.swp %.mem %.dsk %.lvm

PNGS = reznov-cpl.png reznov-swp.png raid-lvm.png raid-avioms.png reznov-mem.png \
	   rootdisk-lvm.png rootdisk-avioms.png \
	   swapdisk-lvm.png

all: $(PNGS)

clean:
	rm -f $(PNGS) *.cpl *.swp

%.cpl: %.log
	atop -PCPL -r $< > $@.tmp && mv $@.tmp $@

%.dsk: %.log
	atop -PDSK -r $< > $@.tmp && mv $@.tmp $@

%.mem: %.log
	atop -PMEM -r $< > $@.tmp && mv $@.tmp $@

%.swp: %.log
	atop -PSWP -r $< > $@.tmp && mv $@.tmp $@

%.lvm: %.log
	atop -PLVM -r $< > $@.tmp && mv $@.tmp $@

raid.lvm: reznov.lvm
	grep -E '(^RESET|^SEP|raid-lvsrv)' $< > $@

rootdisk.lvm: reznov.lvm
	grep -E '(^RESET|^SEP|tacklebox-root)' $< > $@

swapdisk.lvm: reznov.lvm
	grep -E '(^RESET|^SEP|tacklebox-swap_1)' $< > $@

%-cpl.png: %.cpl bin/cpl2png.sh
	bin/cpl2png.sh $< $* $@

%-swp.png: %.swp bin/swp2png.sh
	bin/swp2png.sh $< $* $@

%-mem.png: %.mem bin/mem2png.sh
	bin/mem2png.sh $< $* $@

%-dsk.png: %.dsk bin/dsk2png.sh
	bin/dsk2png.sh $< $* $@

%-lvm.png: %.lvm bin/dsk2png.sh
	bin/dsk2png.sh $< $* $@

%-avioms.png: %.lvm bin/avioms2png.sh
	bin/avioms2png.sh $< $* $@


