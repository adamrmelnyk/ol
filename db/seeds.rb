require 'csv'
csv_contents = File.read('./50k_businesses.csv')
csv = CSV.parse(csv_contents, :headers => true)
csv.each do |row|
  t = Business.new
  t.id = row['id']
  t.uuid = row['uuid']
  t.name = row['name']
  t.address = row['address']
  t.address2 = row['address2']
  t.city = row['city']
  t.state = row['state']
  t.zip = row['zip']
  t.country = row['country']
  t.phone = row['phone']
  t.website = row['website']
  t.created_at = row['created_at']
  t.save
end
