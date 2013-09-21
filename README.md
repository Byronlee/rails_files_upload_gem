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
* 改为要上传的服务器地址 

### 后台

```ruby
  def create
    @uploader = RailsFilesUploadGem::FilesUploader.new Settings.template_path
    begin
      render :json => @uploader.handle(params[:files])
    rescue
      # 上传失败，处理上传失败的情况
    end
  end
```

## Reference

* http://www.see-source.com/blog/300000033/395
* https://github.com/blueimp/jQuery-File-Upload/wiki/API
* https://github.com/blueimp/jQuery-File-Upload  


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
