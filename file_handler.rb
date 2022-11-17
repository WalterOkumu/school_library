require 'json'

class FileHandler
  def file_handling(file_name)
    if file_exist?(file_name)
      file = File.open(file_name, 'r+')
      JSON.parse(file.read)
    else
      []
    end
  end

  def file_exist?(file_name)
    File.exist?(file_name)
  end

  def save(file_name, arr_obj)
    file = ''
    if file_exist?(file_name)
      file = File.open(file_name, 'r+')
    else
      file = File.open(file_name, 'w')
    end
    arr_obj = JSON.pretty_generate(arr_obj)
    file.rewind
    file.write(arr_obj)
    file.close
  end
end
