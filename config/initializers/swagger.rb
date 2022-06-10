# config/initializers/swagger-docs.rb
Swagger::Docs::Config.register_apis({
  "1.0" => {
    :api_file_path => "public/",
    :base_path => "http://localhost:3000",
    :clean_directory => true,
    #:parent_controller => ApplicationController,
    #:base_api_controller => ApplicationController,
    :attributes => {
      :info => {
        "title" => "Technikum weterynaryjne",
        "description" => "Internetowa baza danych Technikum"
      }
    }
  }
})
