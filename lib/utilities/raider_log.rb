# frozen_string_literal: true

require 'forwardable'
require 'logger'

module RubyRaider
  module RaiderLog
    extend Forwardable
    def_delegators :level, :level=, :debug, :info, :warn, :error, :fatal

    def set_logger_level(level: ::Logger::WARN)
      @logger_level = level
    end

    private

    def logger
      @logger ||= begin
        set_logger_level unless @logger_level
        logger = ::Logger.new($stdout, level: @logger_level)
        logger
      end
    end
  end
end
