var path = require('path')

var PDFParser = require('pdf2json')

var parser = new PDFParser()

parser.on('pdfParser_dataReady', function(pdf) {
  pdf.data.Pages[0].Texts.forEach(function(text) {
    console.log(unescape(text.R[0].T))
  })
})

parser.on('pdfParser_dataError', console.log)

parser.loadPDF(path.join(__dirname, 'testpdf.pdf'))