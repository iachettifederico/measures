require "zeitwerk"

loader = Zeitwerk::Loader.new

settings = Settings.new

settings.load_dirs.each do |directory_to_load|
  loader.push_dir(directory_to_load)
end

loader.setup

loader.eager_load
