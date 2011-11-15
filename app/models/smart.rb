class Smart < ActiveRecord::Base
  has_many :line_items

  validates :name, :uniqueness => true, :presence => true

  validates :description, :length => {:maximum => 20}

  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}

  validates :image_url, :format => {
      :with => /\.(gif|jpg|png)$/i,
      :message => 'Debe ser un imagen de tipo GIF, JPG o PNG'
  }


  end
