require 'test_helper'

class CommandeTest < ActiveSupport::TestCase
  test "une nouvelle commande" do
    c = Commande.new
    assert c.id == nil
  end
end
