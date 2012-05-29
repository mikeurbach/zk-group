require 'rspec/core/formatters/progress_formatter'

# essentially a monkey-patch to the ProgressBarFormatter, outputs 
# '== #{example_proxy.description} ==' in the logs before each test.  makes it
# easier to match up tests with the SQL they produce
class LoggingProgressBarFormatter < RSpec::Core::Formatters::ProgressFormatter
  def example_started(example)
    ::Logging.logger['spec'].write(yellow("\n=====<([ #{example.full_description} ])>=====\n"))
    super
  end
end

