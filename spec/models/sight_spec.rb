require 'rails_helper'

RSpec.describe Sight, type: :model do

  it 'animal is valid with all attr filled' do
    animal = Animal.create name: 'lion', latin: 'latin', kingdom: 'king'
    expect(animal).to be_valid
  end

  it 'animal is valid when all attr NOT filled' do
    animal = Animal.create name: 'tiger', latin: 'tiger latin'
    expect(animal.errors[:kingdom]).to_not be_empty
  end

  it 'sight is valid with all attr filled' do
    animal = Animal.create name: 'lion', latin: 'latin', kingdom: 'king'
    sight = Sight.create animal_id: animal.id, date: Date.today, latitude: 5, longitude: 5
    expect(sight).to be_valid
    
  end

  it 'sight is should not be valid when all attr are NOT filled' do
    animal = Animal.create name: 'lion', latin: 'latin', kingdom: 'king'
    sight = Sight.create animal_id: animal.id, date: Date.today, longitude: 5
    expect(sight.errors[:latitude]).to_not be_empty

  end

  it 'latin and name cannot be same' do
    animal = Animal.create name: 'lion', latin: 'lion', kingdom: 'king'
    expect(animal.errors[:name]).to_not be_empty
    expect(animal.errors[:latin]).to_not be_empty

  end

  it 'latin and name must be unique' do
    animal1 = Animal.create name: 'lion', latin: 'lion', kingdom: 'king'
    animal2 = Animal.create name: 'lion', latin: 'lion', kingdom: 'king'
    expect(animal1).not_to be_valid
    expect(animal2).not_to be_valid

  end




end
