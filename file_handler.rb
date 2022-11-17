require 'json'

class FileHandler
  def file_handling(file_name)
    if File.exist?(file_name)
      file = File.open(file_name, 'r+')
      JSON.parse(file.read)
    else
      []
    end
  end
end
