module ApplicationHelper
  def product_image(image)
    if FileTest.exist?(Rails.root.join('app', 'assets', 'images', image))
      image
    else
      'sample_product.png'
    end
  end
end
