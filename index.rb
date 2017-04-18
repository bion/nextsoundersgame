require 'fortitude'

class String
  def uglify!
    self.gsub!("\n", ' ').gsub!(/\s+/, ' ')
  end
end

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

        div(class: 'text-content', id: 'home-game-container') do
          h1(class: 'home-game-header')
          h3(class: 'home-countdown')
          p(class: 'home-game-content')
        end
      end
    end
  end

  def page_head
    head do
      meta(content: "text/html; charset=UTF-8", "http-equiv" => "Content-Type")
      meta(charset: "utf-8")
      meta(content: "width=device-width, initial-scale=1.0", name: "viewport")
      meta(content: 'The next Sounders FC game.', name: "description")
      meta(property: 'og:image', content: 'https://i.imgur.com/wbDbx0W.png')

      title('Next Sounders FC Game')

      css_tag('main.css')
      js_tag('app.js')
    end
  end

  def css_tag(src)
    style do
      rawtext File.read("./#{src}").uglify!
    end
  end

  def js_tag(src)
    script(type: 'text/javascript') do
      rawtext File.read("./#{src}").uglify!
    end
  end
end
