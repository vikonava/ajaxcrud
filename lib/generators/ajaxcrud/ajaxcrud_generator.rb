class AjaxcrudGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :name, :type => :string
  argument :attributes, :type => :array, :default => [], :banner => "field:type:boolean field:type:boolean"

  def get_search_attributes
    @search_attributes = Array.new
    attributes.each do |attribute|
      attribute = attribute.split(':');
      if !attribute[2].nil? && attribute[2].downcase == 'true'
    	@search_attributes.push(attribute[0]+":"+attribute[1]);
      end
    end
  end

  def generators
    template "migration.rb", "db/migrate/#{timestamp}_create_#{plural_model}.rb"
    template "models/model.rb", "app/models/#{model_name}.rb"
    template "test/unit/model_test.rb", "test/unit/#{model_name}_test.rb"
    template "test/fixtures/models.yml", "test/fixtures/#{plural_model}.yml"
    route "resources :#{plural_model}"
    route "match '#{model_name}/search' => '#{plural_model}#search'"

    template "views/create.js.erb", "app/views/#{plural_model}/create.js.erb"
    template "views/destroy.js.erb", "app/views/#{plural_model}/destroy.js.erb"
    template "views/edit.js.erb", "app/views/#{plural_model}/edit.js.erb"
    template "views/_form.html.erb", "app/views/#{plural_model}/_form.html.erb"
    template "views/index.html.erb", "app/views/#{plural_model}/index.html.erb"
    template "views/_item.html.erb", "app/views/#{plural_model}/_#{model_name}.html.erb"
    template "views/search.js.erb", "app/views/#{plural_model}/search.js.erb"
    template "views/show.html.erb", "app/views/#{plural_model}/show.html.erb"
    template "views/update.js.erb", "app/views/#{plural_model}/update.js.erb"
    template "controllers/models_controller.rb", "app/controllers/#{plural_model}_controller.rb"

    template "test/unit/helpers/models_helper_test.rb", "test/unit/helpers/#{plural_model}_helper_test.rb"
    template "helpers/models_helper.rb", "app/helpers/#{plural_model}_helper.rb"
    copy_file "helpers/ajaxcrud_helper.rb", "app/helpers/ajaxcrud_helper.rb"
    inject_into_file "app/helpers/application_helper.rb", "  include AjaxcrudHelper\n", :after => "module ApplicationHelper\n"
    copy_file "assets/ajaxcrud.css.scss", "app/assets/stylesheets/ajaxcrud.css.scss"
    copy_file "assets/success.png", "app/assets/stylesheets/images/success.png"
  end

  private

  def model_name
    name.singularize.downcase
  end

  def timestamp
    Time.now.utc.strftime("%Y%m%d%k%M%S")
  end

  def plural_model
    model_name.pluralize
  end
end
