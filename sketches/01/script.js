const program = (url) =>
  fetch(url)
    .then((f) => f.text())
    .then(bqn)

const setupCanvas = (width, height) => {
  const $canvas = Object.assign(document.createElement('canvas'), { width, height })
  const ctx = $canvas.getContext('2d')
  $canvas.parentNode || document.body.appendChild($canvas)
  return ctx
}

const start = async () => {
  console.dir(bqn)
  sysvals.show = (x) => debug(x)

  const getPoints = await program('./mandelbrot.bqn')

  const ctx = setupCanvas(200, 200)
  const points = getPoints(list([ctx.canvas.width, ctx.canvas.height]))

  // console.log(points)
  // debug(points)

  const imageDataRaw = points.flatMap((x) => (x.length === 4 ? x : [...x, 255]))
  const imageData = new ImageData(
    new Uint8ClampedArray(imageDataRaw),
    ctx.canvas.width,
    ctx.canvas.height
  )
  ctx.putImageData(imageData, 0, 0)

  console.log('DONE')
}

start().catch((e) => console.log(fmtErr(e)))
