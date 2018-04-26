require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    name: Field::String,
    item: Field::BelongsTo,
    product_ingredients: Field::HasMany,
    ingredients: Field::HasMany,
    id: Field::Number,
    price: Field::Number,
    ean: Field::String,
    factory: Field::String,
    brand: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    presentation: Field::String,
    path: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :factory,
    :brand,
    :ingredients,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :name,
    :id,
    :price,
    :ean,
    :item,
    :product_ingredients,
    :ingredients,
    :factory,
    :brand,
    :created_at,
    :updated_at,
    :presentation,
    :path,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :price,
    :item,
    :product_ingredients,
    :ingredients,
    :ean,
    :factory,
    :brand,
    :presentation,
    :path,
  ].freeze

  # Overwrite this method to customize how products are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(product)
  #   "Product ##{product.id}"
  # end
end
