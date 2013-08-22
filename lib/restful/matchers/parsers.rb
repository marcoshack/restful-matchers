PARSERS_DIR = File.expand_path(File.join(File.dirname(__FILE__), 'parsers')).freeze
Dir[File.join(PARSERS_DIR, '**', '*.rb')].each { |file| require(file) }