SimpleForm.setup do |config|
  config.wrappers :bootstrap_horizontal, tag: 'div', class: 'control-group form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: 'col-md-3'
    b.wrapper tag: 'div' do |ba|
      ba.use :input, class: 'form-control', wrap_with: { tag: 'div', class: 'col-md-5' }
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
      ba.use :hint, wrap_with: { tag: 'p', class: 'help-block' }
    end
  end
  config.default_wrapper = :bootstrap_horizontal
end
