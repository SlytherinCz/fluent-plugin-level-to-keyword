require 'fluent/plugin/formatter'

module Fluent::Plugin
  class LevelToKeywordFormatter < Formatter    
    Fluent::Plugin.register_formatter("level_to_keyword", self)    
    
    def configure(conf)
      super
    end

    LEVELS = {
      0 => 'emerg',
      1 => 'alert',
      2 => 'crit',
      3 => 'err',
      4 => 'warning',
      5 => 'notice',
      6 => 'info',
      7 => 'debug'
    }
    LEVELS.freeze

    def format(tag, time, record)      
      if (record.include? "level" and (level_number = Float(record["level"])) != nil rescue false)        
        if (LEVELS[level_number.to_i].nil? == false)
          record["level"] = LEVELS[level_number.to_i]
        else
          record["level"] = "other"
        end          
      end
      record
    end
  end
end