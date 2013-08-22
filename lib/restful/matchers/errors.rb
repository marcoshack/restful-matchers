ERRORS_DIR = File.expand_path(File.join(File.dirname(__FILE__), 'errors')).freeze
Dir[File.join(ERRORS_DIR, '**', '*.rb')].each { |file| require(file) }