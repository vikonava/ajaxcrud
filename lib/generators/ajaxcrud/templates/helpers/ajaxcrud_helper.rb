module AjaxcrudHelper
  def ajaxcrud_init_js(record_name, record_new_text, record_info_text)
    ("$(function() { $('button').button(); $('#"+record_name.pluralize+"_dialog').dialog({ autoOpen: false, modal: true, title: '"+record_new_text+"', resizable: false, draggable: false, close: function() { $('#error_explanation').html('').hide(); } }); $('#"+record_name+"_info').dialog({ autoOpen: false, modal: true, title: '"+record_info_text+"', resizable: false, draggable: false }); $('#"+record_name.pluralize+"_search_field').keyup(function() { $.ajax({url:'/"+record_name+"/search?q='+($(this).val())}); }); });").html_safe
  end

  def ajaxcrud_record_js(record_name, record_new_text)
    ("function viewInfo("+record_name+") { $('#"+record_name+"_info').load("+record_name+", function() { $('#"+record_name.pluralize+"_dialog').dialog('option','width','auto').dialog('option','height','auto').dialog('option','position','center'); $('#"+record_name+"_info').dialog('open'); }); } function new"+record_name.capitalize+"() { $('#"+record_name.pluralize+"_dialog').dialog('open'); $('#"+record_name.pluralize+"_dialog').dialog('option','title','"+record_new_text+"'); $(\".edit_"+record_name+"\").replaceWith(\""+escape_javascript(render(:partial => "form"))+"\"); $(\".new_"+record_name+"\")[0].reset(); $('#"+record_name.pluralize+"_dialog').dialog('option','width','auto').dialog('option','height','auto').dialog('option','position','center'); }").html_safe
  end

  def ajaxcrud_js(record_name, record_new_text, record_info_text)
    ("<script>"+ajaxcrud_init_js(record_name,record_new_text,record_info_text)+"\n"+ajaxcrud_record_js(record_name,record_new_text)+"</script>").html_safe
  end

  def ajaxcrud_dialogbox(record_name)
    ("<div id=\""+record_name.pluralize+"_dialog\"><div id=\"form\">"+render(:partial => "form")+"</div></div><div id=\""+record_name+"_info\"></div>").html_safe
  end

  def ajaxcrud_notices(record_name)
    ("<div id=\""+record_name.pluralize+"_success\" class=\"success\"></div>").html_safe
  end

  def ajaxcrud_search(record_name)
    ("<input id=\""+record_name.pluralize+"_search_field\"/>").html_safe
  end

  def ajaxcrud_new_link(record_name)
    ("javascript:new"+record_name.capitalize+"();").html_safe
  end

  def ajaxcrud_show_link(path)
    ("javascript:viewInfo('"+path+"');").html_safe
  end
end

