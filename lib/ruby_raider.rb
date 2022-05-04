# frozen_string_literal: true

require_relative 'generators/menu_generator'

# Main module to load all the generators
module RubyRaider
  module_function

  def generate_project(project_name)
    MenuGenerator.generate_choice_menu(project_name)
  end
end
