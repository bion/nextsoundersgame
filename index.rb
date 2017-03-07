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
      # h1('sounders', class: 'sounders')

      div(class: 'content') do
        h1(class: 'intro') do
          text 'Next '
          span('Sounders', class: 'sounders')
          text ' Game'
        end

        h3(class: 'countdown')

        div(class: 'text-content') do
          p(class: 'game-content')
        end

        div(class: 'text-content') do
          h1(class: 'home-game-header')
          p(class: 'home-game-content')
        end

        div(class: 'text-content') do
          p(class: 'suggestion') do
            text 'In the meantime '
            span(class: 'suggestion-links') do
              a('get smart', href: 'https://www.amazon.com/Inverting-Pyramid-History-Soccer-Tactics/dp/1568587384')
              text ' or '
              a('get hyped', href: 'https://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=seattle+sounders')
              text '.'
            end
          end
        end
      end
    end
  end

  def page_head
    head do
      meta(content: "text/html; charset=UTF-8", "http-equiv" => "Content-Type")
      meta(charset: "utf-8")
      meta(content: "width=device-width, initial-scale=1.0", name: "viewport")
      meta(content: 'How long until the next Seattle Sounders FC game?', name: "description")

      title('Next Sounders FC Game')

      css_tag('main.css')
      js_tag('app.js')
    end
  end

  def css_tag(src)
    link(rel: 'stylesheet', href: src)
  end

  def js_tag(src)
    script(type: 'text/javascript', src: src)
  end
end
