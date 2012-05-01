require 'rspec/core/formatters/progress_formatter'

module Motionbox
  # essentially a monkey-patch to the ProgressBarFormatter, outputs 
  # '== #{example_proxy.description} ==' in the logs before each test.  makes it
  # easier to match up tests with the SQL they produce
  class LoggingProgressBarFormatter < RSpec::Core::Formatters::ProgressFormatter
    def example_started(example)
      ZK.logger.info(yellow("\n=====<([ #{example.full_description} ])>=====\n"))
      super
    end
  end
end

