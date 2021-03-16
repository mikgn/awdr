Product.create!(
  title: 'Macbook Pro M1',
  description: %(<p> \
    Apple M1 chip with 8‑core CPU, 8‑core GPU, and 16‑core Neural Engine \
    8GB unified memory \
    256GB SSD storage \
    13-inch Retina display with True Tone \
    Backlit Magic Keyboard - US English \
    Touch Bar and Touch ID \
    Two Thunderbolt / USB 4 ports
    </p>),
  image_url: 'macbook.jpg',
  price: 1299.00
)

Product.create!(
  title: 'Iphone 12',
  description: %(<p> \
    The iPhone 12 features a 6.1-inch (15 cm) \
    display with Super Retina XDR OLED technology \
    at a resolution of 2532×1170 pixels and a pixel \
    density of about 460 ppi. The iPhone 12 Mini features \
    a 5.4-inch (14 cm) display with the same technology at a \
    resolution of 2340×1080 pixels and a pixel density of about 476 ppi.
    </p>),
  image_url: 'iphone.jpg',
  price: 999.00
)

Product.create!(
  title: 'Ipad 2020',
  description: %(<p> \
    From the front, the 2020 iPad Pro could pass \
    for a clone of the 2018 model. The 11.05 x 8.46-inch \
    dimensions for the 12.9-inch model are the same, it \
    still has a USB-C/Thunderbolt 3 port, and it still charges \
    the second-generation Apple Pencil through a magnetic strip on \
    the side. Were it not for the new square camera bump accommodating \
    the extra lenses in this model, even the backside would look identical. \
    Unfortunately, because of that bump, you won’t be able to reuse a 2018 \
    Smart Keyboard Folio with this case, unless you don’t mind the back cover \
    awkwardly jutting out because of the poor fit.
    </p>),
  image_url: 'ipad.jpg',
  price: 799.00
)
