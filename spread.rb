p require 'rubygems'
p require 'google_drive'

session = GoogleDrive.login("mail@address.com", "password")
ws = session.spreadsheet_by_key("REPLACE_SPREAD_KEY").worksheets[0]
p ws[2, 1]

ws[2, 2] = "foo"
ws[1, 3] = "bar"
ws.save

p "rows : #{ws.num_rows}"
p "cols : #{ws.num_cols}"
