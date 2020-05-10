# frozen_string_literal: true

module FranchiseHelper
  def display_franchise_name(franchise)
    franchise ? "#{franchise.city} #{franchise.mascot}" : 'None'
  end
end
