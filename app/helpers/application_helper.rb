module ApplicationHelper
  def link_to_remove_revfields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_revfields(this)")
  end

  def link_to_add_revfields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, h("add_revfields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
end
