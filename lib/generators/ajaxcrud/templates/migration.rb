class Create<%= plural_model.capitalize %> < ActiveRecord::Migration
  def change
    create_table :<%= plural_model %> do |t|<% 
  attributes.each do |attribute| 
    attribute = attribute.split(':') %>
      t.<%= attribute[1] %> :<%= attribute[0] %><%
  end
%>
      t.timestamps
    end
  end
end
