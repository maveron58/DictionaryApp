# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@lan1 = Language.create(:name => 'pl');
@lan2 = Language.create(:name => 'en');
@lan3 = Language.create(:name => 'de');

for i in 0..15 do
  Word.create(:word => "aa" * i, :definition => "jj" * i, :from => @lan1, :to => @lan1 )
end

for i in 0..15 do
  Word.create(:word => "bb" * i, :definition => "kk" * i, :from => @lan1, :to => @lan2 )
end

for i in 0..15 do
  Word.create(:word => "cc" * i, :definition => "ll" * i, :from => @lan1, :to => @lan3 )
end

for i in 0..15 do
  Word.create(:word => "dd" * i, :definition => "mm" * i, :from => @lan2, :to => @lan1 )
end

for i in 0..15 do
  Word.create(:word => "ee" * i, :definition => "nn" * i, :from => @lan2, :to => @lan2 )
end

for i in 0..15 do
  Word.create(:word => "ff" * i, :definition => "oo" * i, :from => @lan2, :to => @lan3 )
end

for i in 0..15 do
  Word.create(:word => "gg" * i, :definition => "pp" * i, :from => @lan3, :to => @lan1 )
end

for i in 0..15 do
  Word.create(:word => "hh" * i, :definition => "rr" * i, :from => @lan3, :to => @lan2 )
end

for i in 0..15 do
  Word.create(:word => "ii" * i, :definition => "ss" * i, :from => @lan3, :to => @lan3 )
end