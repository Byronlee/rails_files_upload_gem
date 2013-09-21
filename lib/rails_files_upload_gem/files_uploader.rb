# -*- coding: utf-8 -*-
module RailsFilesUploadGem
  
  class FilesUploader
  
    def initialize(save_path)
      @save_path = save_path
    end

    def read file
      @file_name = file.original_filename
      @size = file.size
      @file = file.read
    end

    def handle files
     details = files.inject([]) do |result , file|
        begin
          read file
          write
          result <<  JSON.parse('{
                 "name":  "#{@file_name}",
                 "size":  "#{@size}"}')
          result
        rescue
          raise "上传失败！"
        end
      end
      JSON.parse('{"files":"#{details}"}')
    end
      
    def write
      File.open(@save_path+@file_name ,"wb"){|f|
        f.write(@file)
      }
    end
  end
end
