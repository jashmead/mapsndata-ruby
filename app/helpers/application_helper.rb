module ApplicationHelper

  def tagged_id(tag = nil)
    id_bits = [ controller.controller_name, controller.action_name]
    id_bits.push(tag) if tag
    id_bits.join('-').html_safe
  end

  # from http://api.rubyonrails.org, form_for documentation:
  def form_for_mad(model, *args, &block)
    options = args.extract_options!
    form_for(model, *(args << options.merge(builder: FormBuilderMad)), &block)
  end 

end
