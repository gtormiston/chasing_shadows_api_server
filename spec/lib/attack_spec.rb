require 'rails_helper'
require 'attack'

describe Attack do
  let(:enemy) { double "enemy" }
  let(:attacker) { double "attacker"}


  describe ".run" do
    it "should damage the enemy if within range" do
      allow(enemy).to receive_messages(within_range_of: true,
                                       damage: nil,
                                       name: "MonsterName")
     allow(attacker).to receive_messages(
                                      name: "attackerNAme")
      Attack.run(enemy, attacker)
      expect(enemy).to have_received :damage
    end

    it "doens't damage the enemy if not in range" do
      allow(enemy).to receive_messages(within_range_of: false,
                                       damage: nil,
                                       name: "MonsterName")
     allow(attacker).to receive_messages(
                                      name: "attackerNAme")
      Attack.run(enemy, attacker)
      expect(enemy).not_to have_received :damage
    end
  end
end
