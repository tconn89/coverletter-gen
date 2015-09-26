inspector = Card
inspector.count.times do |i|
	if inspector.exists?(id:i)
		puts "#{inspector.find(i).id}: #{inspector.find(i).name}"
	end
end