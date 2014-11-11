module SmartManaging
  def self.configure(&block)
    yield @config ||= SmartManaging::Configuration.new
  end

  def self.config
    @config ||= SmartManaging::Configuration.new
  end

  class Configuration
    DEFAULTS = {
      style: :bootstrap3
    }

    def initialize
      @options = DEFAULTS
    end

    def method_missing(sym, *args, &block)
      @options[sym]
    end

    def style=(value)
      @options[:style] = value
    end
  end
end
