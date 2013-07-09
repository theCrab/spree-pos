Update
========

Doing re-work for update to last version of spree 2.0

SpreePos
===============

A Point Of Sale (POS) screen for Spree.

POS screen hooks into the Admin Tabs and is meant to be used to sell inside a shop, possibly with a touchscreen and a scanner.

Allows for quick checkout and basic adjustment of line item prices also with discount percentages.

A minimal transaction is one scan, and pressing of print button.

Basic bar scanner input (sku/ean search) or search by name. No Customer, no shipping, no coupons, but these are achievable through the order interface.

POS creates orders (just like the admin/order) and in fact lets you switch between the two views freely by adding
links back and forth.

Pressing new customer will create a new order (in checkout), which is finalised when print is pressed.

ONLY pressing print will finalise the order, if you do not press print (ie press new customer) the order will be left
 in "checkout" state and thus not be a sale in your system.

Inventory
=========

This feature has been deprecated because it is no longer anymore. Have to first refactor the code and use stock
locations.

Dependencies
============

NOTICE: WORKING IN THIS FOR MAKE IT WORKS

spree_html_invoice ..... but

The dependency is not made explicit in case you don't need receipt (see configure section).

By default POS relies on html-invoice to print a receipt. You can configure this away by setting :pos_printing to the url where you want to redirect after print. By default it is "/admin/invoice/number/receipt" which relies on spree-html-invoice to be installed. To remove this dependency you could redirect to the order show like so

SpreePos::Config.set(:pos_printing => "admin/orders/number") #and number gets substituted with the order number

You can install spree-product-barcodes to print product labels if need be. Otherwise use the existing upc barcodes on the products and scan them into the sku.


Configure
=========

An Order must be shipped, so you must configure a ShippingMethod to be used. If you don't the first will be
taken, rarely what you want.

SpreePos::Config.set(:pos_shipping => "MethodName") #Usually something like "pickup" with cost 0

POS uses the first Spree::PaymentMethod::Check in the current environment for payment. So this is actually not configurable, but the PaymentMethod has to be configured for POS to work

If you don't change the :pos_printing  config as described above, you must add 

gem 'spree_html_invoice' , :git => 'git://github.com/dancinglightning/spree-html-invoice.git'

to your gemfile. If you do, you _will_ want to configure the look of the receipt

EAN
====

NOTICE: Not tested in the last version of spree

Many sales and especially POS systems rely on barcode scanning. A barcode scanner functions identical to keyboard
input  to the product code. You may use the sku field for this but we use that for the suppliers code (or our own).

So there is a migration supplied that provides a ean (European Article code, may be upc too) for the Variant class, and fields to edit it and search by it.

Installation
=======

Add to your Gemfile with 

  gem "spree_pos", :git => "git://github.com/CodeCantor/spree-pos.git"

and run bundler. (read about the dependencies if you haven't yet)


Copyright (c) 2011 [Torsten Ruger], released under the New BSD License
