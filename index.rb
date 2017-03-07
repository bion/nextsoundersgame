require 'fortitude'

class Index < Fortitude::Widget
  doctype :html5

  def content
    doctype!

    html(lang: 'en') do
      page_head

      page_body
    end
  end

  private

  def page_body
    body do
      h1(class: 'countdown')
    end
  end

  def page_head
    head do
      meta(content: "text/html; charset=UTF-8", "http-equiv" => "Content-Type")
      meta(charset: "utf-8")
      meta(content: "width=device-width, initial-scale=1.0", name: "viewport")
      meta(content: 'How long until the next Seattle Sounders FC game?', name: "description")

      title('Sounders FC Game countdown!')

      js_tag('app.js')
    end
  end

  def js_tag(src)
    script(type: 'text/javascript', src: src)
  end
end
