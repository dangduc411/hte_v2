WickedPdf.config = {
  :exe_path => Rails.env.production? ? '/usr/local/bin/wkhtmltopdf' : '/usr/bin/wkhtmltopdf'
}