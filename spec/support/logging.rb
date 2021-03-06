module ZK
  LOG_FILE = File.expand_path('../../../test.log', __FILE__)
end

ZK.logger = Logger.new(ZK::LOG_FILE).tap { |log| log.level = Logger::DEBUG }

# Zookeeper.logger = ZK.logger
# Zookeeper.set_debug_level(4)

ZK.logger.debug { "LOG OPEN" }

module SpecGlobalLogger
  def logger
    ZK.logger
  end

  # sets the log level to FATAL for the duration of the block
  def mute_logger
    orig_level, ZK.logger.level = ZK.logger.level, Logger::FATAL
    orig_zk_level, Zookeeper.debug_level = Zookeeper.debug_level, ZookeeperConstants::ZOO_LOG_LEVEL_ERROR
    yield
  ensure
    ZK.logger.level = orig_level
  end
end

