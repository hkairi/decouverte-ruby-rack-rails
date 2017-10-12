require 'rails_helper'

RSpec.describe Utilisateur, type: :model do
  context 'création de compte utilisateur' do
    it 'ne doit pas avoir de doublons' do
      should validate_presence_of :email
      should validate_uniqueness_of :email
    end
  end

  context 'Relations' do
    it 'should have many demandes' do
      should have_many :demandes
    end
  end

  context 'Nouvel utilisateur' do
    it 'ne doit pas avoir de demandes' do
      expect(subject.demandes.size).to eq 0
    end
  end
end
