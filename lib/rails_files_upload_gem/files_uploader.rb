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

    def write
      File.open(@save_path+@file_name ,"wb"){|f|
        f.write(@file)
      }
    end
  end
end
