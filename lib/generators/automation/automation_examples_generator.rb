# frozen_string_literal: true

require_relative '../generator'

class AutomationExamplesGenerator < Generator
  def generate_example_files
    if mobile_platform?
      generate_home_page
      generate_pdp_page
    elsif visual_selected?
      generate_login_page
      generate_app_page
    else
      generate_model_factory
      generate_model_data
      generate_header_component
      generate_login_page
    end
  end

  private

  def generate_login_page
    template('login_page.tt', "#{name}/page_objects/pages/login_page.rb")
  end

  def generate_home_page
    template('home_page.tt', "#{name}/page_objects/pages/home_page.rb")
  end

  def generate_pdp_page
    template('pdp_page.tt', "#{name}/page_objects/pages/pdp_page.rb")
  end

  def generate_header_component
    template('component.tt', "#{name}/page_objects/components/header_component.rb")
  end

  def generate_app_page
    template('app_page.tt', "#{name}/page_objects/pages/app_page.rb")
  end

  def generate_model_factory
    template('factory.tt', "#{name}/models/model_factory.rb")
  end

  def generate_model_data
    template('data.tt', "#{name}/models/data/users.yml")
  end
end
