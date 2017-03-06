require 'fortitude'

class Index < Fortitude::Widget
  doctype :html5

  def content
    doctype!

    html do
      body do
        h1 'hello world!'
      end
    end
  end
end
