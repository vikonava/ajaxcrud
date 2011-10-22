class <%= plural_model.capitalize %>Controller < ApplicationController
  def index
    @<%= plural_model %> = <%= model_name.capitalize %>.all
    @<%= model_name %> = <%= model_name.capitalize %>.new

    respond_to do |format|
      format.html
    end
  end

  def search
    query = "<% 
  @search_attributes.each do |attribute| 
    attribute = attribute.split(':') 
    %><%= attribute[0] %> LIKE ? OR <%
  end
%>1 > ?"

    @<%= plural_model %> = <%= model_name.capitalize %>.where(query, <%
  attributes.each do |attribute|
    attribute = attribute.split(':')
    if !attribute[2].nil? && attribute[2] == "true"
      %>"%#{params[:q]}%", <%
    end
  end
%> 2)

    respond_to do |format|
      format.js
    end
  end

  def show
    @<%= model_name %> = <%= model_name.capitalize %>.find(params[:id])

    render :layout => false
  end

  def showjs
    @<%= model_name %> = <%= model_name.capitalize %>.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def edit
    @<%= model_name %> = <%= model_name.capitalize %>.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create
    @<%= model_name %> = <%= model_name.capitalize %>.new(params[:<%= model_name %>])
    @<%= model_name %>.save

    respond_to do |format|
      format.js
    end
  end

  def update
    @<%= model_name %> = <%= model_name.capitalize %>.find(params[:id])
    @<%= model_name %>.update_attributes(params[:<%= model_name %>])

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @<%= model_name %> = <%= model_name.capitalize %>.find(params[:id])
    @<%= model_name %>.destroy

    respond_to do |format|
      format.js
    end
  end
end
