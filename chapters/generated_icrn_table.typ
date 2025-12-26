// 你現在的 avg 只有算出 ic_1 與 r_n 的「各自平均」。
// 表格最後一欄的 ic-1-rn 是用 prod(avg.ic_1, avg.r_n) 變成「平均值相乘」
// 這不等於 average(ic_1 * r_n)，因此會看起來「平均值算錯」。

#let num(v, digits: 1) = if v == none { none } else { calc.round(v, digits: digits) }
#let prod(a, b) = if a == none or b == none { none } else { a * b }

#let average-of(values) = {
  let vals = values.filter(v => v != none)
  if vals.len() == 0 { none } else { vals.sum() / vals.len() }
}

#let cell(v, bold: false) = {
  if v == none { [] } else if bold { [*#v*] } else { [#v] }
}

#let devices = (
  (id: "003-2", ic_ref: 29.4589006, ic_1: 3.93508151, r_n: 1.847959),
  (id: "003-3", ic_ref: 19.1114887, ic_1: 3.13333840, r_n: 3.160584),
  (id: "004-1", ic_ref: 24.0, ic_1: none, r_n: 29.30),
  (id: "004-2", ic_ref: 44.0, ic_1: none, r_n: 33.952986),
  (id: "004-3", ic_ref: 64.00, ic_1: none, r_n: 34.104993),
  (id: "005-1", ic_ref: 121.495620, ic_1: 3.30457732, r_n: 0.297211),
  (id: "005-2", ic_ref: 44.2751820, ic_1: 3.20294505, r_n: 1.048790),
  (id: "019-1", ic_ref: 22.8338767, ic_1: 2.58307981, r_n: 0.661574),
  (id: "019-3", ic_ref: 19.20, ic_1: none, r_n: 1.237747),
  (id: "019-5", ic_ref: 22.00, ic_1: none, r_n: 2.971104),
)

#let rows = devices.map(d => (
  id: d.id,
  ic_ref: d.ic_ref,
  ic_1: d.ic_1,
  r_n: d.r_n,
  ic_ref_rn: prod(d.ic_ref, d.r_n),
  ic_1_rn: prod(d.ic_1, d.r_n),
))

#let avg = (
  id: "平均值",
  ic_ref: average-of(rows.map(r => r.ic_ref)),
  ic_1: average-of(rows.map(r => r.ic_1)),
  r_n: average-of(rows.map(r => r.r_n)),
  ic_ref_rn: average-of(rows.map(r => r.ic_ref_rn)),
  ic_1_rn: average-of(rows.map(r => r.ic_1_rn)),
)

#let data = rows + (avg,)

#table(
  columns: (1.2fr,) * 6,
  align: center,

  table.header(
    [*元件編號*],
    [*$I_c^("Ref")$ (µA)*],
    [*$I_c^("(1)")$ (µA)*],
    [*$R_N$ (Ω)*],
    [*$I_c^("Ref") R_N$ (µV)*],
    [*$I_c^("(1)") R_N$ (µV)*],
  ),

  ..data
    .map(r => {
      let bold = r.id == "平均值"
      (
        cell(r.id, bold: bold),
        cell(num(r.ic_ref, digits: 3), bold: bold),
        cell(num(r.ic_1, digits: 3), bold: bold),
        cell(num(r.r_n, digits: 3), bold: bold),
        cell(num(r.ic_ref_rn, digits: 3), bold: bold),
        cell(num(r.ic_1_rn, digits: 3), bold: bold),
      )
    })
    .flatten(),
)
