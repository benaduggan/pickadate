# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_Dorm_and_Floor_entries(dormName,floorArray)
  dorm = Dorm.create(:name => dormName)
  floorArray.each do |floor|
    x = Floor.create({:name => floor[:name], :gender => floor[:gender]})
    x.dorm_id = dorm.id
    x.dorm.floor_id = x.id
    x.save
    dorm.save
  end
end

create_Dorm_and_Floor_entries( "Sammy" ,[{name: 'Foundation' , gender: 'male'},{name: 'Sammy II' , gender: 'male'},{name: 'Broho' , gender: 'male'},{name: 'Penthouse' , gender: 'male'}])

create_Dorm_and_Floor_entries("Swallow",[{name: '1st' , gender: 'female'},{name: '2nd' , gender: 'male'},{name: '3rd' , gender: 'female'}])

create_Dorm_and_Floor_entries( "Wengatz" ,[{name: '1st West' , gender: 'male'},{name: '2nd West' , gender: 'male'},{name: '3rd West' , gender: 'male'},{name: '2nd Center' , gender: 'male'},{name: '3rd Center' , gender: 'male'},{name: '1st East' , gender: 'male'},{name: '2nd East' , gender: 'male'},{name: '3rd East' , gender: 'male'}])

create_Dorm_and_Floor_entries( 'Olson' ,[{name: '1st East' , gender: 'female'},{name: '2nd East' , gender: 'female'},{name: '3rd East' , gender: 'female'},{name: '2nd Center' , gender: 'female'},{name: '3rd Center' , gender: 'female'},{name: '1st East' , gender: 'female'},{name: '2nd West' , gender: 'female'},{name: '3rd West' , gender: 'female'}])

create_Dorm_and_Floor_entries( 'English' ,[{name: 'Cellar', gender: 'female'},{name: '1st North' , gender: 'female'},{name: '1st South' , gender: 'female'},{name: '2nd North' , gender: 'female'},{name: '2nd Center' , gender: 'female'},{name: '2nd South' , gender: 'female'},{name: '3rd North' , gender: 'female'},{name: '3rd Center' , gender: 'female'},{name: '3rd South' , gender: 'female'}])

create_Dorm_and_Floor_entries('Gerig',[{name: '2G' , gender: 'female'},{name: '3G' , gender: 'female'},{name: 'Foso' , gender: 'male'}])

create_Dorm_and_Floor_entries("Breuninger",[{name: '1st' , gender: 'male'},{name: '2nd' , gender: 'female'},{name: '3rd' , gender: 'female'}])

create_Dorm_and_Floor_entries('Bergwall',[{name: '1st Berg' , gender: 'male'},{name: 'Sigma Beta' , gender: 'male'},{name: '3rd Berg' , gender: 'female'},{name: '4th Berg' , gender: 'female'}])