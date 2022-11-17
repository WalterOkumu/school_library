require 'json'

class FileHandler
  def file_handling(file_name)
    file_exist = File.exist?(file_name)
    if file_exist
      file = File.open(file_name, 'r+')
      return JSON.parse(file.read)
    end
    []
  end

  def save(file_name, arr_obj)
    file = File.exist?(file_name) ? File.open(file_name, 'r+') : File.open(file_name, 'w')
    arr_obj = JSON.pretty_generate(arr_obj)
    file.rewind
    file.write(arr_obj)
    file.close
  end
end
