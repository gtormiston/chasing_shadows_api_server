require 'rails_helper'

describe Enemy, type: :model do

  let(:user) { double "user" }

  before(:each) do
    @spitafileds_monster = Enemy.create(name: "Spitafields Monster", active: true, size: 1,lat: 51.51734, lng: -0.0732808)
    @inactive_monster = Enemy.create(name: "Inactive Monster", active: false, size: 1,lat: 51.51734, lng: -0.0732808)
    @greenwich_monster = Enemy.create(name: "Inactive Monster", active: true, size: 1,lat: 51.482576, lng: -0.0076589)
  end

  describe ".within_range_of(user)" do
    it "returns active enemies within range of the user" do
      allow(user).to  receive_messages(lat: 51.51734,
                                       lng: -0.0732808)
      expect(Enemy.within_range_of(user)).to include @spitafileds_monster
      expect(Enemy.within_range_of(user)).not_to include @inactive_monster
      expect(Enemy.within_range_of(user)).not_to include @greenwich_monster
    end
  end

  describe "#damage" do
    it "reduces the size of a monster" do
      expect(@spitafileds_monster.size).to eq 1
      @spitafileds_monster.damage
      expect(@spitafileds_monster.size).to eq 0
    end

    it "deactivates dead monsters" do
      expect(@spitafileds_monster.active).to eq true
      @spitafileds_monster.damage
      expect(@spitafileds_monster.active).to eq false
    end

  end


  describe "#within_range_of(attacker)" do
    it "returns true if user is within attack range" do
      allow(user).to  receive_messages(lat: 51.51734,
                                       lng: -0.0732808)
      expect(@spitafileds_monster.within_range_of(user)).to be true
    end

    it "returns false if user is not within attack range" do
      allow(user).to  receive_messages(lat: 51.51744,
                                       lng: -0.09002)
      expect(@spitafileds_monster.within_range_of(user)).to be false
    end
  end
end
