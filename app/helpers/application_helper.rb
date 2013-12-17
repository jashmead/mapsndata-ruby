module ApplicationHelper

  def tagged_id(tag = nil)
    id_bits = [ controller.controller_name, controller.action_name]
    id_bits.push(tag) if tag
    id_bits.join('-').html_safe
  end

end
