# RailsFilesUploadGem

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'rails_files_upload_gem'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_files_upload_gem

## Usage

### 前端
* 用浏览器打开工程文件夹下的index.html,将js代码中
```ruby
  var url = '/templates/create';
```
* 改为要上传的服务器地址．
### 后台
```ruby
  def create

    # file_uploader = RailsFilesUploadGem::FilesUploader.new Settings.template_path
    # file_uploader.read params[:file]
    #   begin
    #     file_uploader.write
    #     #result = XmlParser.new(HttpClient.send(create_syn_xml))
    #     #result.get_result.eql?("success")? flash[:notice] = "上传成功！" : flash[:notice] = "上传失败！#{result.get_reason}."
    #     redirect_to new_template_path
    #   rescue
    #     # 上传失败，稍后再试
    #     #redirect_to new_template_path
    #   end
    
    details = params[:files].inject([]) do |result , file|
      File.open(Settings.template_path+file.original_filename ,"wb"){|f|
        f.write(file.read)
      }
      result << JSON.parse('{
                 "name":  "#{file.original_filename}",
                 "size":  "#{file.size}"}')
      result
    end
    render :json => details

  end
```
	
## Reference
* http://www.see-source.com/blog/300000033/395
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
