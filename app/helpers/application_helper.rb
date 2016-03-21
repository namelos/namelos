module ApplicationHelper
  class Highlight < Redcarpet::Render::HTML
    def block_code(code, lang)
      CodeRay.scan(code, lang).div
    end
  end

  def markdown(text)
    highlighted = Highlight.new(:filter_html => true, :hard_wrap => true)

    options = { :fenced_code_blocks => true,
                :no_intra_emphasis => true,
                :autolink => true,
                :lax_html_blocks => true }

    markdown_to_html = Redcarpet::Markdown.new(text, options)
    markdown_to_html.render(text).html_safe
  end

  def log
    'simple log'
  end
end
