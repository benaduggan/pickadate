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
    dorm.floors.create({:name => floor[:name], :gender => floor[:gender]})
  end
end

create_Dorm_and_Floor_entries( "Sammy" ,[{name: 'Foundation' , gender: 'male'},{name: 'Sammy II' , gender: 'male'},{name: 'Broho' , gender: 'male'},{name: 'Penthouse' , gender: 'male'}])

create_Dorm_and_Floor_entries("Swallow",[{name: '1st Swallow' , gender: 'female'},{name: '2nd Swallow' , gender: 'male'},{name: '3rd Swallow' , gender: 'female'}])

create_Dorm_and_Floor_entries( "Wengatz" ,[{name: '1WW' , gender: 'male'},{name: '2WW' , gender: 'male'},{name: '3WW' , gender: 'male'},{name: '2CW' , gender: 'male'},{name: '3CW' , gender: 'male'},{name: '1EW' , gender: 'male'},{name: '2EW' , gender: 'male'},{name: '3EW' , gender: 'male'}])

create_Dorm_and_Floor_entries( 'Olson' ,[{name: '1EO' , gender: 'female'},{name: '2EO' , gender: 'female'},{name: '3EO' , gender: 'female'},{name: '2CO' , gender: 'female'},{name: '3CO' , gender: 'female'},{name: '1WO' , gender: 'female'},{name: '2WO' , gender: 'female'},{name: '3WO' , gender: 'female'}])

create_Dorm_and_Floor_entries( 'English' ,[{name: 'Cellar', gender: 'female'},{name: '1NE' , gender: 'female'},{name: '1SE' , gender: 'female'},{name: '2NE' , gender: 'female'},{name: '2CE' , gender: 'female'},{name: '2SE' , gender: 'female'},{name: '3NE' , gender: 'female'},{name: '3CE' , gender: 'female'},{name: '3SE' , gender: 'female'}])

create_Dorm_and_Floor_entries('Gerig',[{name: '2G' , gender: 'female'},{name: '3G' , gender: 'female'},{name: 'Foso' , gender: 'male'}])

create_Dorm_and_Floor_entries("Breuninger",[{name: '1st Breu' , gender: 'male'},{name: '2nd Breu' , gender: 'female'},{name: '3rd Breu' , gender: 'female'}])

create_Dorm_and_Floor_entries('Bergwall',[{name: '1st Berg' , gender: 'male'},{name: 'Sigma Beta' , gender: 'male'},{name: '3rd Berg' , gender: 'female'},{name: '4th Berg' , gender: 'female'}])