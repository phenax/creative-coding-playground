CMul ← { ⟨a, b⟩𝕊⟨c, d⟩: ⟨a×c - b×d, a×d + b×c⟩ }
CMag ← +´×˜
MandelbrotFn ← +⟜(CMul˜)

MBValue ← {⟨w, h⟩ 𝕊 ⟨x, y⟩:
  p ← 6 × ⟨(x - w÷2)÷w, (y - h÷2)÷h⟩
  iters ← 0
  old ← 0‿0
  CMag p⊸MandelbrotFn •_while_ {
    isFinite ← 70 > CMag (𝕩 - old)
    old↩𝕩
    iters+↩1
    isFinite ∧ iters < 10
  } 0‿0
}

MBGrid ← {dimens 𝕊 grid: {⟨0.7, 0.4, 1⟩ × (dimens MBValue 𝕩) | 255}¨grid}

{𝕊⟨w, h⟩:
  grid ← (>{↕h}¨↕w) ∾¨ h⥊˘↕w
  p ← ⟨1, 1⟩
  ⟨w, h⟩ MBGrid grid
}
