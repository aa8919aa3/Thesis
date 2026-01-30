#import "@preview/unify:0.7.1": *

#set text(lang: "en")
Working with English characters:
$ num("-1.32865+-0.50273e-6") $
$ qty("1.3+1.2-0.3e3", "erg/cm^2/s", space: "#h(2mm)") $
$ numrange("1,1238e-2", "3,0868e5", thousandsep: "'") $
$ qtyrange("1e3", "2e3", "meter per second squared", per: "/", delimiter: "\"to\"") $
$ qty("55.36", "usd") $

Adding your own prefix and unit:
#add-prefix("pre", "P", "upright(\"pre\")")
#add-unit("unit", "U", "bold(\"unit\")")
$ unit("PU") $

#set text(lang: "ru")
Работа пакета с русскими символами:
$ num("-1.32865+-0.50273e-6") $
$ qty("1.3+1.2-0.3e3", "erg/cm^2/s", space: "#h(2mm)") $
$ numrange("1,1238e-2", "3,0868e5", thousandsep: "'") $
$ qtyrange("1e3", "2e3", "meter per second squared", per: "/", delimiter: "\"до\"") $

#set text(lang: "de")
Other languages fall back to English units:
$ num("-1.32865+-0.50273e-6") $
$ qty("1.3+1.2-0.3e3", "erg/cm^2/s", space: "#h(2mm)") $
$ numrange("1,1238e-2", "3,0868e5", thousandsep: "'") $
$ qtyrange("1e3", "2e3", "meter per second squared", per: "/", delimiter: "\"to\"") $

#let m2b-specs = (
  "Input noise voltage": [$qty("2", "") "nV"/sqrt("Hz")$ > $qty("10", "Hz")$ ($qty("2.5", "") "nV"/sqrt("Hz")$ \@ $qty("1", "Hz")$ !!)],
  "Input noise current": [$qty("5", "") "fA"/sqrt("Hz")$],
  "Input bias current": [< $qty("5", "pA")$],
  "Temp drift": [< $qty("2", "uV/degC")$],
  "Bandwidth": [$qty("200", "kHz")$..$qty("10", "kHz")$ (gain=$qty("100", "")$..$qty("10", "k")$)],
  "Gain": [$qty("100", "V/V")$/$qty("1", "kV/V")$/$qty("10", "kV/V")$ (on ac, $qty("100", "")$/$qty("1", "k")$/$qty("10", "k")$ dc-gain=$qty("100", "")$ fixed)],
)

#table(
  columns: 2,
  stroke: none,
  [Property], [Value],
  ..m2b-specs.pairs().flatten(),
)
specs:
Input noise voltage: 2nV/sqrt Hz >10Hz (2.5nV/sqrtHz \@1Hz !!)
Input noise current: 5fA/sqrtHz
Input bias current : \<5pA
Temp drift         : \<2uV/c
Bandwidth          : 200kHz..10kHz (gain=100..10K)
Gain               : 100/1k/10k V/V (on ac, 100/1k/10k dc-gain=100 fixed)
