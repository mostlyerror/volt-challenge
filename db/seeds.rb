## EQUIPMENT #####

equipment_names = <<-EQUIPMENT
Band
Barbell
Bench
Box
Cable Machine
Dumbbell
Glute-Ham
Incline Bench
Lat Pulldown
Medicine Ball
Pullup Bar
Squat Rack
Kettlebell
Stability Ball
EQUIPMENT

equipment = equipment_names.split(/\n+/).map do |name|
  Equipment.find_or_create_by(name: name)
end


## SPORTS #####

sports_names = <<-SPORTS
Soccer
Football
Baseball
Basketball
Lacrosse
Tennis
Swimming
SPORTS

sports = sports_names.split(/\n+/).map do |name|
  Sport.find_or_create_by(name: name)
end


## PROGRAMS #####

program_names = <<-PROGRAMS
General Hypertrophy
Lean & Mean
Weight Loss
PROGRAMS

program_names.split(/\n+/).each do |name|
  program = Program.find_by(name: name)
  if program.nil?
    Program.create(
      name: name,
      equipments: equipment.sample(rand(0..(equipment.size)))
    )
  end
end

program = Program.find_by(name: "Men's Beginner Football")
if program.nil?
  Program.create(
    name: "Women's Intermediate Soccer",
    equipments: equipment.sample(rand(0..(equipment.size))),
    sport: sports.find {|sp| sp.name == "Soccer" }
  )
end

program = Program.find_by(name: "Men's Beginner Football")
if program.nil?
  Program.create(
    name: "Men's Beginner Football",
    equipments: equipment.sample(rand(0..(equipment.size))),
    sport: sports.find {|sp| sp.name == "Football" }
  )
end