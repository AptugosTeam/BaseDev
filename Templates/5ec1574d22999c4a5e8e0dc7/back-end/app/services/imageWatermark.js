/*
path: imageWatermark.js
keyPath: back-end/app/services/imageWatermark.js
unique_id: DcCFPSrT
*/
const sharp = require('sharp')
const path = require('path')

async function saveImageWithWatermark(inputBuffer, outputPath) {
  const watermarkPath = path.join(__dirname, '../watermarks/logo.png')

  const baseImage = sharp(inputBuffer)
  const metadata = await baseImage.metadata()

  const watermark = await sharp(watermarkPath)
    .resize(Math.floor(metadata.width * 0.25)) // 25% width
    .png()
    .toBuffer()

  await baseImage
    .composite([
      {
        input: watermark,
        gravity: 'southeast', // bottom-right
        blend: 'overlay',
        opacity: 0.5,
      },
    ])
    .jpeg({ quality: 90 })
    .toFile(outputPath)
}

export default saveImageWithWatermark