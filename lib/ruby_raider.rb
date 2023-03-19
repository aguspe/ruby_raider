# frozen_string_literal: true

require_relative '../lib/commands/open_ai_commands'
require_relative '../lib/commands/scaffolding_commands'
require_relative '../lib/commands/utility_commands'

module RubyRaider
  class Raider < Thor
    desc 'new [PROJECT_NAME]', 'Creates a new framework based on settings picked'

    def new(project_name)
      MenuGenerator.new(project_name).generate_choice_menu
    end

    map '-n' => 'new'

    desc 'version', 'It shows the version of Ruby Raider you are currently using'
    def version
      spec = Gem::Specification.load('ruby_raider.gemspec')
      version = spec.version
      puts "The Ruby Raider version is #{version}, Happy testing!"
    end

    map 'v' => 'version'

    desc 'generate', 'Provides access to all the generators commands'
    subcommand 'generate', ScaffoldingCommands
    map 'g' => 'generate'

    desc 'open_ai', 'Provides access to all the open ai commands'
    subcommand 'open_ai', OpenAiCommands
    map 'o' => 'open_ai'

    desc 'utility', 'Provides access to all the utility commands'
    subcommand 'utility', UtilityCommands
    map 'u' => 'utility'
  end
end
