class Renderer < Redcarpet::Render::HTML
  def postprocess(doc)
    "<p>#{doc}</p>"
  end
end