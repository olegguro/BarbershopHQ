class CreateBarbers < ActiveRecord::Migration[5.2]
  def change
  	create_table :barbers do |t|
  		t.text :name
  		
  		t.timestamps
  	
  		end
	#создаем наполнение в таблице
	Barber.create :name => 'Jessie Pinkman'  
	Barber.create :name => 'Walter White'
	Barber.create :name => 'Gus Fring'

  end
end
