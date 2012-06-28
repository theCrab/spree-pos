if Spree::Variant.first and Spree::Variant.first.respond_to? :ean
  Deface::Override.new(:virtual_path => "spree/admin/products/_form",
                       :name => "Add ean to product form",
                       :insert_after => "code[erb-silent]:contains('has_variants')",
                       :text => "<% unless @product.has_variants? %> <p>
                              <%= f.label :ean, t(:ean) %><br>
                              <%= f.text_field :ean, :size => 16 %>
                              </p> <%end%>",
                       :disabled => false)
  Deface::Override.new(:virtual_path => "spree/admin/variants/_form",
                       :name => "add_ean_to_variants_edit",
                       :insert_after => "[data-hook='sku']",
                       :text => "<p data-hook='ean'>
                              <%= f.label :ean, t(:ean) %><br>
                              <%= f.text_field :ean, :size => 16 %>
                              </p>",
                       :disabled => false)
else
  puts "POS: EAN support disabled, run migration to activate"
end
