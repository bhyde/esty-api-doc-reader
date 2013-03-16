;; This was automatically generated.
;; notice there is no in-package form

( ;; <<-- start the giant plist


:coupon

(:name "Coupon" :overview "Represents a shop coupon." :fields
 ((:id "coupon_id" :visiblity :private :permission-scope :shops_rw
   :type "int" :description "The numeric ID of the coupon")
  (:id "coupon_code" :visiblity :private :permission-scope :shops_rw
   :type "string" :description "The alphanumeric coupon code")
  (:id "seller_active" :visiblity :private :permission-scope
   :shops_rw :type "boolean" :description
   "True if the coupon is active")
  (:id "pct_discount" :visiblity :private :permission-scope :shops_rw
   :type "int" :description
   "The discount percent (null for free shipping coupons)")
  (:id "free_shipping" :visiblity :private :permission-scope
   :shops_rw :type "boolean" :description
   "True if the coupon applies free shipping")
  (:id "domestic_only" :visiblity :private :permission-scope
   :shops_rw :type "boolean" :description
   "True if the coupon free shipping applies to domestic addresses only")
  (:id "currency_code" :visiblity :private :permission-scope
   :shops_rw :type "string" :description
   "The 3 letter currency code relating to currency values if any. fixed_discount or minimum_purchase_price")
  (:id "fixed_discount" :visiblity :private :permission-scope
   :shops_rw :type "string" :description
   "Discount amount the coupon should take. For currency information see currency_code")
  (:id "minimum_purchase_price" :visiblity :private :permission-scope
   :shops_rw :type "string" :description
   "The minimum amount in a cart before tax or shipping needed in order to apply the coupon. For currency information see currency_code")
  (:id "coupon_type" :visiblity :private :permission-scope :shops_rw
   :type "string" :description
   "The type of coupon: fixed_discount, pct_discount, free_shipping for example"))
 :associations nil :methods nil)


:listingimage

(:name "ListingImage" :overview "A photograph of a listing for sale.

Supported Sizes[anchor]

The ListingImage resource includes fields for the following sizes, which be officially supported by Etsy at least through the end of 2013:

   Size                   Where We Use It
75x75       small thumbnail
170x135     homepage, treasuries, shop listings
570xN       listing page
fullxfull   listing page zoom

Additional sizes are available but do not have specific fields in the resource. Instead, treat the full size URL as a template. Use the ImageType methods to retrieve available sizes for listing images; any of these can be subsituted in place of \"fullxfull\" in the full size URL to make a new URL for the listing image of that size.

The 570xN and fullxfull image sizes have variable dimensions depending on the original artwork uploaded by the seller:

  • For the 570xN size, the horizontal dimension will be the original artwork's horizontal size, or 570 pixels, whichever is smaller. Likewise for all other *xN images
  • For the fullxfull size, the horizontal dimension will be the original artwork's horizontal size, or 1500 pixels, whichever is smaller.
  • These sizes will have a variable vertical dimension, dependent on the original artwork's aspect ratio.

Resizing, Cropping and Caching Images[anchor]

If the provided sizes don't suit your application, you are free to download the larger image sizes, resize and cache them for your own use, as long as you adhere to our API Terms of Use.

Uploading Images[anchor]

Image uploads can be performed using a POST request with the Content-Type: multipart/form-dataheader, following RFC1867. This is identical to using curl -F, except that that request needs to be signed using OAuth.

Your OAuth toolkit must support multipart form uploads as described above. Here is example code for PHP using the PECL OAuth 1.1 extension (PECL OAuth 1.0 will not work):

// You must define the constants OAUTH_CONSUMER_KEY and OAUTH_CONSUMER_SECRET
// You must also assign values to the variables $access_token, $access_token_secret,
// $listing_id and $filename, and $mimetype.
// Your image file is assumed to be in the same directory as this code.

$oauth = new OAuth(OAUTH_CONSUMER_KEY, OAUTH_CONSUMER_SECRET);

$oauth->enableDebug();
$oauth->setToken($access_token, $access_token_secret);

try {
    $source_file = dirname(realpath(__FILE__)) .\"/$filename\";

    $url = \"http://openapi.etsy.com/v2/listings/\".$listing_id.\"/images\";
    $params = array('@image' => '@'.$source_file.';type='.$mimetype);

    $oauth->fetch($url, $params, OAUTH_HTTP_METHOD_POST);

    $json = $oauth->getLastResponse();
    print_r(json_decode($json, true));

} catch (OAuthException $e) {
    // You may want to recover gracefully here...
    print $oauth->getLastResponse().\"\\n\";
    print_r($oauth->debugInfo);
    die($e->getMessage());
}"
 :fields
 ((:id "listing_image_id" :visiblity :public :permission-scope nil
   :type "int" :description "The numeric ID of the listing image.")
  (:id "hex_code" :visiblity :public :permission-scope nil :type
   "string" :description
   "The image's average color, in webhex notation.")
  (:id "red" :visiblity :public :permission-scope nil :type "int"
   :description "The image's average red value, 0-255 (RGB color).")
  (:id "green" :visiblity :public :permission-scope nil :type "int"
   :description
   "The image's average green value, 0-255 (RGB color).")
  (:id "blue" :visiblity :public :permission-scope nil :type "int"
   :description "The image's average blue value, 0-255 (RGB color).")
  (:id "hue" :visiblity :public :permission-scope nil :type "int"
   :description "The image's average hue, 0-360 (HSV color).")
  (:id "saturation" :visiblity :public :permission-scope nil :type
   "int" :description
   "The image's average saturation, 0-100 (HSV color).")
  (:id "brightness" :visiblity :public :permission-scope nil :type
   "int" :description
   "The image's average brightness, 0-100 (HSV color).")
  (:id "is_black_and_white" :visiblity :public :permission-scope nil
   :type "boolean" :description
   "True if the image is in black & white.")
  (:id "creation_tsz" :visiblity :public :permission-scope nil :type
   "float" :description "Creation time, in epoch seconds.")
  (:id "listing_id" :visiblity :public :permission-scope nil :type
   "int" :description
   "The numeric value of the listing id the image belongs to.")
  (:id "rank" :visiblity :public :permission-scope nil :type "int"
   :description "Display order.")
  (:id "url_75x75" :visiblity :public :permission-scope nil :type
   "string" :description
   "The url to a 75x75 thumbnail of the image.")
  (:id "url_170x135" :visiblity :public :permission-scope nil :type
   "string" :description
   "The url to a 170x135 thumbnail of the image.")
  (:id "url_570xN" :visiblity :public :permission-scope nil :type
   "string" :description
   "The url to a thumbnail of the image, no more than 570px width by variable height.")
  (:id "url_fullxfull" :visiblity :public :permission-scope nil :type
   "string" :description
   "The url to the full-size image, no more than 1500px width by variable height.")
  (:id "full_height" :visiblity :public :permission-scope nil :type
   "int" :description
   "Height of the image returned by url_fullxfull.")
  (:id "full_width" :visiblity :public :permission-scope nil :type
   "int" :description
   "Width of the image returned by url_fullxfull."))
 :associations
 ((:id "Listing" :visiblity :public :permission-scope nil :type
   "Listing" :description "The listing to which the image belongs."))
 :methods
 ((:method-name "findAllListingImages" :synopsis
   "Retrieves a set of ListingImage objects associated to a Listing."
   :http-method :get :method-uri "/listings/:listing_id/images"
   :parameters
   ((:id "listing_id" :required t :default nil :type "int")) :oauth?
   nil :pscope nil)))


:shop

(:name "Shop" :overview
 "Represents a shop with listings for sale.  Each shop is owned by one user."
 :fields
 ((:id "shop_id" :visiblity :public :permission-scope nil :type "int"
   :description "The shop's numeric ID.")
  (:id "shop_name" :visiblity :public :permission-scope nil :type
   "string" :description "The shop's name.")
  (:id "first_line" :visiblity :private :permission-scope :shops_rw
   :type "string" :description
   "The first line of the shops address. DEPRECATED: use UserAddress.first_line instead.")
  (:id "second_line" :visiblity :private :permission-scope :shops_rw
   :type "string" :description
   "The second line of the shops address. DEPRECATED: use UserAddress.second_line instead.")
  (:id "city" :visiblity :private :permission-scope :shops_rw :type
   "string" :description
   "The city the shop is in. DEPRECATED: use UserAddress.city instead.")
  (:id "state" :visiblity :private :permission-scope :shops_rw :type
   "string" :description
   "The state the shop is in. DEPRECATED: use UserAddress.state instead.")
  (:id "zip" :visiblity :private :permission-scope :shops_rw :type
   "string" :description
   "The zip code the shop is in. DEPRECATED: use UserAddress.zip instead.")
  (:id "country_id" :visiblity :private :permission-scope :shops_rw
   :type "int" :description
   "The numeric ID of the country the shop is in. DEPRECATED: use UserAddress.country_id instead.")
  (:id "user_id" :visiblity :public :permission-scope nil :type "int"
   :description "The numeric ID of the user that owns this shop.")
  (:id "creation_tsz" :visiblity :public :permission-scope nil :type
   "float" :description
   "The date and time the shop was created, in epoch seconds.")
  (:id "title" :visiblity :public :permission-scope nil :type
   "string" :description "A brief heading for the shop's main page.")
  (:id "announcement" :visiblity :public :permission-scope nil :type
   "string" :description
   "An announcement to buyers that displays on the shop's homepage.")
  (:id "currency_code" :visiblity :public :permission-scope nil :type
   "string" :description
   "The ISO code (alphabetic) for the seller's native currency.")
  (:id "is_vacation" :visiblity :public :permission-scope nil :type
   "boolean" :description
   "If the seller is not currently accepting purchases, 1, blank otherwise.")
  (:id "vacation_message" :visiblity :public :permission-scope nil
   :type "string" :description
   "If is_vacation=1, a message to buyers.")
  (:id "sale_message" :visiblity :public :permission-scope nil :type
   "string" :description
   "A message that is sent to users who buy from this shop.")
  (:id "last_updated_tsz" :visiblity :public :permission-scope nil
   :type "float" :description
   "The date and time the shop was last updated, in epoch seconds.")
  (:id "listing_active_count" :visiblity :public :permission-scope
   nil :type "int" :description
   "The number of active listings in the shop.")
  (:id "login_name" :visiblity :public :permission-scope nil :type
   "string" :description "The user's login name.")
  (:id "lat" :visiblity :private :permission-scope :shops_rw :type
   "float" :description "The latitude of the shop.")
  (:id "lon" :visiblity :private :permission-scope :shops_rw :type
   "float" :description "The longitude of the shop.")
  (:id "accepts_custom_requests" :visiblity :public :permission-scope
   nil :type "boolean" :description
   "True if the shop accepts requests for custom items.")
  (:id "policy_welcome" :visiblity :public :permission-scope nil
   :type "string" :description
   "The introductory text from the top of the seller's policies page (may be blank).")
  (:id "policy_payment" :visiblity :public :permission-scope nil
   :type "string" :description
   "The seller's policy on payment (may be blank).")
  (:id "policy_shipping" :visiblity :public :permission-scope nil
   :type "string" :description
   "The seller's policy on shipping (may be blank).")
  (:id "policy_refunds" :visiblity :public :permission-scope nil
   :type "string" :description
   "The seller's policy on refunds (may be blank).")
  (:id "policy_additional" :visiblity :public :permission-scope nil
   :type "string" :description
   "Any additional policy information the seller provides (may be blank).")
  (:id "policy_seller_info" :visiblity :public :permission-scope nil
   :type "string" :description
   "The shop's seller information (may be blank).")
  (:id "policy_updated_tsz" :visiblity :public :permission-scope nil
   :type "float" :description
   "The date and time the shop was last updated, in epoch seconds.")
  (:id "vacation_autoreply" :visiblity :public :permission-scope nil
   :type "string" :description
   "If is_vacation=1, a message to buyers in response to new convos.")
  (:id "ga_code" :visiblity :private :permission-scope :shops_rw
   :type "string" :description "The shop's Google Analytics code.")
  (:id "name" :visiblity :private :permission-scope :shops_rw :type
   "string" :description
   "The shop owner's real name. DEPRECATED: use UserAddress.name instead.")
  (:id "url" :visiblity :public :permission-scope nil :type "string"
   :description "The URL of the shop")
  (:id "image_url_760x100" :visiblity :public :permission-scope nil
   :type "string" :description "The URL to the shop's banner image.")
  (:id "num_favorers" :visiblity :public :permission-scope nil :type
   "int" :description
   "The number of members who've marked this Shop as a favorite")
  (:id "has_tax_preferences" :visiblity :public :permission-scope nil
   :type "boolean" :description
   "True if this shop has any tax rate preferences set.")
  (:id "languages" :visiblity :public :permission-scope nil :type
   (array-of "string") :description
   "The languages that this Shop is enrolled in."))
 :associations
 ((:id "User" :visiblity :public :permission-scope nil :type "User"
   :description "The user who owns this shop.")
  (:id "About" :visiblity :public :permission-scope nil :type
   "ShopAbout" :description "Detailed data about this shop.")
  (:id "Sections" :visiblity :public :permission-scope nil :type
   (array-of "ShopSection") :description
   "An array of sections within the shop.  Each section holds listings.")
  (:id "Listings" :visiblity :public :permission-scope nil :type
   (array-of "Listing") :description
   "An array of listings within the shop.  (Must be used with scope \"active\", e.g.: Listings:active).")
  (:id "Receipts" :visiblity :private :permission-scope :shops_rw
   :type (array-of "Receipt") :description
   "An array of receipts (one per buyer) for this shop.")
  (:id "Transactions" :visiblity :private :permission-scope :shops_rw
   :type (array-of "Transaction") :description
   "An array of transactions (sold items) for this shop.")
  (:id "Translations" :visiblity :public :permission-scope nil :type
   (array-of "ShopTranslation") :description
   "An array of translations for this Shop."))
 :methods
 ((:method-name "findAllShops" :synopsis
   "Finds all Shops. If there is a keywords parameter, finds shops with shop_name starting with keywords."
   :http-method :get :method-uri "/shops" :parameters
   ((:id "shop_name" :required nil :default nil :type "string")
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int")
    (:id "lat" :required nil :default nil :type "latitude")
    (:id "lon" :required nil :default nil :type "longitude")
    (:id "distance_max" :required nil :default "35" :type "float"))
   :oauth? nil :pscope nil)
  (:method-name "getShop" :synopsis "Retrieves a Shop by id."
   :http-method :get :method-uri "/shops/:shop_id" :parameters
   ((:id "shop_id" :required t :default nil :type
     (array-of "shop_id_or_name")))
   :oauth? nil :pscope nil)))


:imagetype

(:name "ImageType" :overview "Describes the available image types."
 :fields
 ((:id "code" :visiblity :public :permission-scope nil :type "string"
   :description "Code for this image type, used in image URLs")
  (:id "desc" :visiblity :public :permission-scope nil :type "string"
   :description "Text description of the image type")
  (:id "sizes" :visiblity :public :permission-scope nil :type
   (array-of "string") :description
   "Available sizes for this image type"))
 :associations nil :methods
 ((:method-name "listImageTypes" :synopsis
   "Lists available image types along with their supported sizes."
   :http-method :get :method-uri "/image_types" :parameters nil
   :oauth? nil :pscope nil)))


:team

(:name "Team" :overview
 "Teams represent a community of users on Etsy, found at www.etsy.com/teams. Generally, the Etsy API only exposes public teams data. Using OAuth, a team captain may see pending or invited team members using the findAllUsersForTeam method."
 :fields
 ((:id "group_id" :visiblity :public :permission-scope nil :type
   "int" :description "The team's numeric ID.")
  (:id "name" :visiblity :public :permission-scope nil :type "string"
   :description "The team's name.")
  (:id "create_date" :visiblity :public :permission-scope nil :type
   "int" :description
   "The date and time the team was created in Epoch seconds.")
  (:id "update_date" :visiblity :public :permission-scope nil :type
   "int" :description
   "The date and time the team was last updated in Epoch seconds.")
  (:id "tags" :visiblity :public :permission-scope nil :type
   (array-of "string") :description
   "A list of tags describing the team."))
 :associations nil :methods
 ((:method-name "findAllTeams" :synopsis "Returns all Teams"
   :http-method :get :method-uri "/teams" :parameters
   ((:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)
  (:method-name "findTeams" :synopsis
   "Returns specified team by ID or team name" :http-method :get
   :method-uri "/teams/:team_ids/" :parameters
   ((:id "team_ids" :required t :default nil :type
     (array-of "team_id_or_name")))
   :oauth? nil :pscope nil)
  (:method-name "findAllTeamsForUser" :synopsis
   "Returns a list of teams for a specific user" :http-method :get
   :method-uri "/users/:user_id/teams" :parameters
   ((:id "user_id" :required t :default nil :type "user_id_or_name")
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)))


:cart

(:name "Cart" :overview
 "Represents a shopping cart on Etsy. Users have one cart per shop."
 :fields
 ((:id "cart_id" :visiblity :private :permission-scope :cart_rw :type
   "int" :description "The numeric ID of the cart")
  (:id "shop_name" :visiblity :private :permission-scope :cart_rw
   :type "string" :description "The shop name")
  (:id "message_to_seller" :visiblity :private :permission-scope
   :cart_rw :type "string" :description "The message to the seller")
  (:id "destination_country_id" :visiblity :private :permission-scope
   :cart_rw :type "int" :description
   "The numeric ID of the destination country")
  (:id "coupon_code" :visiblity :private :permission-scope :cart_rw
   :type "string" :description
   "The alphanumeric coupon code applied to the cart")
  (:id "currency_code" :visiblity :private :permission-scope :cart_rw
   :type "string" :description
   "The ISO (alphabetic) code for the currency")
  (:id "total" :visiblity :private :permission-scope :cart_rw :type
   "string" :description "The total price")
  (:id "subtotal" :visiblity :private :permission-scope :cart_rw
   :type "string" :description "The subtotal price")
  (:id "shipping_cost" :visiblity :private :permission-scope :cart_rw
   :type "string" :description "The shipping cost")
  (:id "tax_cost" :visiblity :private :permission-scope :cart_rw
   :type "string" :description "The tax cost")
  (:id "discount_amount" :visiblity :private :permission-scope
   :cart_rw :type "string" :description
   "The line-item discount amount (does not include tax or shipping)")
  (:id "shipping_discount_amount" :visiblity :private
   :permission-scope :cart_rw :type "string" :description
   "The shipping discount amount")
  (:id "tax_discount_amount" :visiblity :private :permission-scope
   :cart_rw :type "string" :description "The tax discount amount")
  (:id "url" :visiblity :private :permission-scope :cart_rw :type
   "string" :description "The full URL to the cart page on Etsy")
  (:id "listings" :visiblity :private :permission-scope :cart_rw
   :type (array-of "CartListing") :description
   "An array of purchase information for the listings"))
 :associations
 ((:id "Shop" :visiblity :private :permission-scope :cart_rw :type
   "Shop" :description "The shop")
  (:id "Listings" :visiblity :private :permission-scope :cart_rw
   :type (array-of "Listing") :description "An array of listings")
  (:id "Coupon" :visiblity :private :permission-scope :cart_rw :type
   "Coupon" :description "The coupon applied to the cart"))
 :methods nil)


:ledgerentry

(:name "LedgerEntry" :overview
 "Represents an entry in a shop's ledger." :fields
 ((:id "ledger_entry_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The ledger entry's numeric ID.")
  (:id "ledger_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The ledger's numeric ID.")
  (:id "sequence" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The sequence allows ledger entries to be sorted chronologically. The higher the sequence, the more recent the entry.")
  (:id "credit_amount" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The amount of money credited to the ledger.")
  (:id "debit_amount" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The amount of money debited from the ledger.")
  (:id "entry_type" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "Details what kind of ledger entry this is: a payment, refund, disbursement, returned disbursement, or recoupment")
  (:id "reference_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "Depending on the entry_type, this is the id of the corresponding payment, payment adjustment, or disbursement.")
  (:id "running_balance" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The amount of money in the shop's ledger the moment after this entry was applied.")
  (:id "create_date" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The date and time the ledger entry was created in Epoch seconds."))
 :associations nil :methods nil)


:shippingtemplate

(:name "ShippingTemplate" :overview
 "Represents a template used to set a listing's shipping information.

ShippingTemplate, ShippingTemplateEntry, and ShippingInfo[anchor]

The diagram below is an ERD of the relevant portion of the database related to Listings.  Each Listing has a User,  and each User can have 0 or more ShippingTemplates.  We are enforcing that a user create at least one ShippingTemplate before creating a listing.   When that Listing is created the ShippingTemplate gets copied into the ShippingInfo table and is associated to that Listing.  You can then edit the ShippingInfo directly for a listing,  or update your ShippingTemplate and update the Listing with it.

[seller_too]

  • A ShippingTemplate has a title and is owned by a user.
  • ShippingInfo is a set of records that define shipping information for a specific listing.  They are created from a ShippingTemplate.
  • ShippingTemplateEntries are a set of rows that correspond to this template.
      □ They hold an origin country,  and a destination, as well as the primary and secondary cost.
      □ There is only one origin per template,  so this is changed on the ShippingTemplate resource instead of the ShippingTemplateEntry. 
  • You can pass a destination id or a region id when creating a ShippingTemplateEntry, but not both - If you leave them both blank then the destination is assumed to be \"everywhere\"
  • If you create a  ShippingTemplateEntry with a region,  this implies several destinations and will insert a row for each destination within that region.
  • If you delete a ShippingTemplateEntry that is a region,  it will delete all corresponding destinations for that region.
  • You can update a ShippingTemplateEntry,  but because a region defines many rows, and different regions may have a different number of rows,  you cannot update the region.   You must first delete an entry corresponding to that region,  and then add an entry with the new region."
 :fields
 ((:id "shipping_template_id" :visiblity :private :permission-scope
   :listings_r :type "int" :description
   "The numeric ID of this shipping template.")
  (:id "title" :visiblity :private :permission-scope :listings_r
   :type "string" :description "The name of this shipping template.")
  (:id "user_id" :visiblity :private :permission-scope :listings_r
   :type "int" :description
   "The numeric ID of the user who owns this shipping template."))
 :associations
 ((:id "Entries" :visiblity :private :permission-scope :listings_r
   :type (array-of "ShippingTemplateEntry") :description
   "An array of shipping info entries that belong to this template."))
 :methods nil)


:style

(:name "Style" :overview
 "A user-supplied style attached to a listing. A user can either select from suggested styles, or create custom style."
 :fields
 ((:id "style_id" :visiblity :public :permission-scope nil :type
   "int" :description "Style ID for this style")
  (:id "style" :visiblity :public :permission-scope nil :type
   "string" :description "Style Name"))
 :associations nil :methods
 ((:method-name "findSuggestedStyles" :synopsis
   "Retrieve all suggested styles." :http-method :get :method-uri
   "/taxonomy/styles" :parameters nil :oauth? nil :pscope nil)))


:shopaboutmember

(:name "ShopAboutMember" :overview "Data about a user's shop."
 :fields
 ((:id "shop_about_member_id" :visiblity :public :permission-scope
   nil :type "int" :description "Numeric ID of this ShopAboutMember")
  (:id "shop_id" :visiblity :public :permission-scope nil :type "int"
   :description "Numeric ID of the associated Shop")
  (:id "name" :visiblity :public :permission-scope nil :type "string"
   :description "The name of this ShopAboutMember")
  (:id "role" :visiblity :public :permission-scope nil :type "string"
   :description "The role of this ShopAboutMember")
  (:id "bio" :visiblity :public :permission-scope nil :type "string"
   :description "The bio of this ShopAboutMember")
  (:id "rank" :visiblity :public :permission-scope nil :type "int"
   :description "The order of this member in a list")
  (:id "is_owner" :visiblity :public :permission-scope nil :type
   "boolean" :description
   "Whether this Member is an owner. A Shop can have multiple owners.")
  (:id "url_90x90" :visiblity :public :permission-scope nil :type
   "string" :description
   "The url to a thumbnail of the image, exactly 90px by 90px.")
  (:id "url_190x190" :visiblity :public :permission-scope nil :type
   "string" :description
   "The url to a thumbnail of the image, exactly 190px by 190px."))
 :associations nil :methods nil)


:country

(:name "Country" :overview
 "Represents a geographical country and its location." :fields
 ((:id "country_id" :visiblity :public :permission-scope nil :type
   "int" :description "The country's numeric ID.")
  (:id "iso_country_code" :visiblity :public :permission-scope nil
   :type "string" :description
   "The two-letter country code according to ISO 3166-1-alpha-2.")
  (:id "world_bank_country_code" :visiblity :public :permission-scope
   nil :type "string" :description
   "The three-letter country code according to the World Bank.")
  (:id "name" :visiblity :public :permission-scope nil :type "string"
   :description "The country's plain-English name.")
  (:id "slug" :visiblity :public :permission-scope nil :type "string"
   :description
   "The country's plain-English name slugified; suitable for interpolation into a url.")
  (:id "lat" :visiblity :public :permission-scope nil :type "float"
   :description "The country's latitude.")
  (:id "lon" :visiblity :public :permission-scope nil :type "float"
   :description "The country's longitude."))
 :associations nil :methods
 ((:method-name "findAllCountry" :synopsis "Finds all Country."
   :http-method :get :method-uri "/countries" :parameters nil :oauth?
   nil :pscope nil)
  (:method-name "getCountry" :synopsis "Retrieves a Country by id."
   :http-method :get :method-uri "/countries/:country_id" :parameters
   ((:id "country_id" :required t :default nil :type
     (array-of "int")))
   :oauth? nil :pscope nil)))


:variations_propertyqualifier

(:name "Variations_PropertyQualifier" :overview
 "A component of the larger Variations_PropertySet data structure, a property qualifier is a recursive data structure describing increasing specificity of a property. For example, for a listing in the Clothing: Pants category, the Size property is further qualified by the Recipient and Scale qualifying properties. A property qualifier describes these dependencies.

NOTE: Support for Listing Variations is a beta feature. For full documentation on working with Listing Variations, see Working with Variations."
 :fields
 ((:id "property_id" :visiblity :public :permission-scope nil :type
   "int" :description "The numeric ID of this property")
  (:id "options" :visiblity :public :permission-scope nil :type
   (array-of "int") :description
   "An array of numeric IDs of available options for this property qualifier")
  (:id "results" :visiblity :public :permission-scope nil :type
   (map "int" "Variations_PropertyQualifier") :description
   "Recursive qualifiers representative of inreased property specificity"))
 :associations nil :methods nil)


:apimethod

(:name "ApiMethod" :overview "A method call from the Etsy API."
 :fields
 ((:id "name" :visiblity :public :permission-scope nil :type "string"
   :description "The method's descriptive name.")
  (:id "uri" :visiblity :public :permission-scope nil :type "string"
   :description
   "The method's URI pattern. Parameters are marked with a leading colon.")
  (:id "params" :visiblity :public :permission-scope nil :type
   "ParamList" :description
   "An array of method parameters and types.")
  (:id "defaults" :visiblity :public :permission-scope nil :type
   "ParamList" :description
   "An array of default values for parameters. Parameters that lack a default are required.")
  (:id "type" :visiblity :public :permission-scope nil :type "string"
   :description "The resource type returned by the method.")
  (:id "visibility" :visiblity :public :permission-scope nil :type
   "string" :description
   "The method's visibility level. Methods marked \"private\" require authentication.")
  (:id "http_method" :visiblity :public :permission-scope nil :type
   "string" :description
   "The HTTP method used to call the API method."))
 :associations nil :methods
 ((:method-name "getMethodTable" :synopsis
   "Get a list of all methods available." :http-method :get
   :method-uri "/" :parameters nil :oauth? nil :pscope nil)))


:feedback

(:name "Feedback" :overview
 "Etsy allows buyers and sellers to leave feedback for one another about a specific transaction. Each feedback record contains a short message from the buyer or seller, a value of -1, 0 or 1, and information about the item that was purchased.

Each feedback record has a buyer, a seller, an author, and a subject. Because feedback is a two-way process, each transaction on Etsy can have up to two feedback records, one left by a buyer in reference to a seller, and one left by a seller in reference to a buyer. To determine the context of a feedback record, you will neeed to examine both the creator_user_id and seller_user_id fields to determine whether the author of the feedback was the buyer or the seller in the transaction.

Feedback and Privacy Settings[anchor]

As of March 14, 2011, all purchases on Etsy are hidden from public areas. This has a direct effect on how feedback records are displayed in the API, since they contain information about a member's purchases. Certain fields of feedback records are now treated as private--this means that they can only been seen using the private API, with either the buyer or seller's OAuth credentials. If these conditions are not met, the fields will be missing from feedback responses.

The context of the API request (whether you are requesting the buyer's or the seller's feedback) has an impact on which fields are considered private. In a nutshell:

  • When querying a buyer's feedback, the seller's identity and the purchased listing will be private.
  • When querying a seller's feedback, the buyer's identity will be private.

The following table gives detailed information on which feeds will be private in various contexts. \"Feedback Author\" refers to the member who left the feedback (either the buyer, or the seller). \"Viewing Context\" refers to the member whose user ID was used to query the feedback (whether we are viewing feedback for the seller, or for the buyer).

Viewing Context  Feedback Author  Feedback Subject  Basic Fields  Buyer Fields  Seller Fields  Purchase Fields  Author Fields  Subject Fields
     Buyer            Buyer            Seller       public        public        private        private          public         private
     Buyer            Seller            Buyer       public        public        private        private          private        public
     Seller           Buyer            Seller       public        private       public         public           private        public
     Seller           Seller            Buyer       public        private       public         public           public         private

This table lists which fields fall under the general headings in the table above:

          Field                  Group
       feedback_id        Basic Fields
      creation_tsz        Basic Fields
         message          Basic Fields
          value           Basic Fields
     transaction_id       Purchase Fields
       Transaction        Purchase Fields
         Listing          Purchase Fields
    image_feedback_id     Purchase Fields
     image_url_25x25      Purchase Fields
   image_url_fullxfull    Purchase Fields
      buyer_user_id       Buyer Fields
          Buyer           Buyer Fields
     seller_user_id       Seller Fields
         Seller           Seller Fields
     creator_user_id      Author Fields
         Author           Author Fields
     target_user_id       Subject Fields
         Subject          Subject Fields"
 :fields
 ((:id "feedback_id" :visiblity :public :permission-scope nil :type
   "int" :description "The feedback record's numeric ID.")
  (:id "transaction_id" :visiblity :public/private :permission-scope
   :feedback_r :type "int" :description
   "The transaction's numeric ID.")
  (:id "creator_user_id" :visiblity :public/private :permission-scope
   :feedback_r :type "int" :description
   "The numeric ID of the user who wrote this feedback. Note: This field may be absent, depending on the buyer's privacy settings.")
  (:id "target_user_id" :visiblity :public/private :permission-scope
   :feedback_r :type "int" :description
   "The numeric ID of the user who received this feedback. Note: This field may be absent, depending on the buyer's privacy settings.")
  (:id "seller_user_id" :visiblity :public/private :permission-scope
   :feedback_r :type "int" :description
   "The numeric ID of the user who was the seller in this transaction.")
  (:id "buyer_user_id" :visiblity :public/private :permission-scope
   :feedback_r :type "int" :description
   "The numeric ID of the user who was the buyer in this transaction. Note: This field may be absent, depending on the buyer's privacy settings.")
  (:id "creation_tsz" :visiblity :public :permission-scope nil :type
   "float" :description "Creation time, in epoch seconds.")
  (:id "message" :visiblity :public :permission-scope nil :type
   "string" :description
   "A message left by the author, explaining the feedback.")
  (:id "value" :visiblity :public :permission-scope nil :type "int"
   :description
   "The feedback's value; 1 is positive, -1 is negative, and 0 is neutral.")
  (:id "image_feedback_id" :visiblity :public/private
   :permission-scope :feedback_r :type "int" :description
   "The numeric ID of the feedback's image (if present). Note: This field may be absent, depending on the buyer's privacy settings.")
  (:id "image_url_25x25" :visiblity :public/private :permission-scope
   :feedback_r :type "string" :description
   "The url to a photo provided with the feedback, dimensions 25x25. Note: This field may be absent, depending on the buyer's privacy settings.")
  (:id "image_url_155x125" :visiblity :public/private
   :permission-scope :feedback_r :type "string" :description
   "The url to a photo provided with the feedback, dimensions 155x125. Note: This field may be absent, depending on the buyer's privacy settings.")
  (:id "image_url_fullxfull" :visiblity :public/private
   :permission-scope :feedback_r :type "string" :description
   "The url to a photo provided with the feedback, dimensions fullxfull. Note: This field may be absent, depending on the buyer's privacy settings."))
 :associations
 ((:id "Buyer" :visiblity :public/private :permission-scope
   :feedback_r :type "User" :description
   "The user who who was the buyer in this transaction. Note: This field may be absent, depending on the buyer's privacy settings.")
  (:id "Seller" :visiblity :public/private :permission-scope
   :feedback_r :type "User" :description
   "The user who was the seller in this transaction.")
  (:id "Author" :visiblity :public/private :permission-scope
   :feedback_r :type "User" :description
   "The user who wrote this feedback. Note: This field may be absent, depending on the buyer's privacy settings.")
  (:id "Subject" :visiblity :public/private :permission-scope
   :feedback_r :type "User" :description
   "The user who received this feedback. Note: This field may be absent, depending on the buyer's privacy settings.")
  (:id "Transaction" :visiblity :public/private :permission-scope
   :feedback_r :type "Transaction" :description
   "The transaction that this feedback pertains to.")
  (:id "Listing" :visiblity :public/private :permission-scope
   :feedback_r :type "Listing" :description
   "The listing that this feedback pertains to."))
 :methods
 ((:method-name "findAllUserFeedbackAsAuthor" :synopsis
   "Retrieves a set of Feedback objects associated to a User."
   :http-method :get :method-uri "/users/:user_id/feedback/as-author"
   :parameters
   ((:id "user_id" :required t :default nil :type "user_id_or_name")
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)
  (:method-name "findAllUserFeedbackAsBuyer" :synopsis
   "Retrieves a set of Feedback objects associated to a User."
   :http-method :get :method-uri "/users/:user_id/feedback/as-buyer"
   :parameters
   ((:id "user_id" :required t :default nil :type "user_id_or_name")
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)
  (:method-name "findAllUserFeedbackAsSeller" :synopsis
   "Retrieves a set of Feedback objects associated to a User."
   :http-method :get :method-uri "/users/:user_id/feedback/as-seller"
   :parameters
   ((:id "user_id" :required t :default nil :type "user_id_or_name")
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)
  (:method-name "findAllUserFeedbackAsSubject" :synopsis
   "Retrieves a set of Feedback objects associated to a User."
   :http-method :get :method-uri
   "/users/:user_id/feedback/as-subject" :parameters
   ((:id "user_id" :required t :default nil :type "user_id_or_name")
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)
  (:method-name "findAllFeedbackFromBuyers" :synopsis
   "Returns a set of FeedBack objects associated to a User. This is essentially the union between the findAllUserFeedbackAsBuyer and findAllUserFeedbackAsSubject methods."
   :http-method :get :method-uri
   "/users/:user_id/feedback/from-buyers" :parameters
   ((:id "user_id" :required nil :default nil :type
     "user_id_or_name")
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)
  (:method-name "findAllFeedbackFromSellers" :synopsis
   "Returns a set of FeedBack objects associated to a User. This is essentially the union between the findAllUserFeedbackAsBuyer and findAllUserFeedbackAsSubject methods."
   :http-method :get :method-uri
   "/users/:user_id/feedback/from-sellers" :parameters
   ((:id "user_id" :required nil :default nil :type
     "user_id_or_name")
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)))


:payment

(:name "Payment" :overview
 "Represents a Payment made with Direct Checkout. Please note all monetary amounts are in USD pennies unless otherwise specified."
 :fields
 ((:id "payment_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The payment's numeric ID.")
  (:id "buyer_user_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The buyer's numeric ID.")
  (:id "shop_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description "The shop's numeric ID.")
  (:id "receipt_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The receipt's numeric ID.")
  (:id "amount_gross" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The original gross amount of the order, in pennies - this is grand total, including shipping and taxes.")
  (:id "amount_fees" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The original card processing fee of the order in pennies.")
  (:id "amount_net" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The total value of the payment less fees (amount_gross - amount_fees).")
  (:id "posted_gross" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The gross amount which posted to the ledger once shipped. This is equal to the amount_gross UNLESS the seller issues a refund prior to shipping. We consider \"shipping\" to the event which \"posts\" to the ledger. Therefore, if the seller refunds first, we simply reduce the amount_gross and post that amount. The seller never sees the refunded amount in their ledger. This is equal to the \"Credit\" amount in the ledger entry.")
  (:id "posted_fees" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "Amount of the fees that posted when shipped. We refund a proportional amount of the fees when a seller refunds a buyer. If they refund prior to shipping, the posted amount will be less then the original.")
  (:id "posted_net" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The total value of the payment at the time of posting it to the ledger less fees (posted_gross - posted_fees)")
  (:id "adjusted_gross" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "If the payment is refunded, partially or fully, this is the new gross amount after the refund.")
  (:id "adjusted_fees" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "If the payment is refunded, partially or fully, this is the new fee amount after the refund.")
  (:id "adjusted_net" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The total value of the payment after refunds less fees (adjusted_gross - adjusted_fees).")
  (:id "currency" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "What currency the payment was made in.")
  (:id "shipping_user_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The numeric id of the user to which the order is being shipped.")
  (:id "shipping_address_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The numeric id identifying the shipping address.")
  (:id "billing_address_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The numeric id identifying the billing address of the buyer.")
  (:id "status" :visiblity :private :permission-scope :transactions_r
   :type "string" :description
   "Most commonly \"settled\" or \"authed\". Marks the current status of the payment.")
  (:id "shipped_date" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The date and time the payment was shipped in Epoch seconds.")
  (:id "create_date" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The date and time the payment was created in Epoch seconds.")
  (:id "update_date" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The date and time the payment was last updated in Epoch seconds."))
 :associations nil :methods nil)


:variations_propertysetoption

(:name "Variations_PropertySetOption" :overview
 "Represents a suggested option value for a listing on Etsy, dependent on the listing's category, and one or more qualified properties (size scale, recipient, etc.)

Although Etsy listings can contain any value for any available property, it's recommended to use these suggested options whenever possible. They may be integrated into Etsy search at a later date.

NOTE: Support for Listing Variations is a beta feature. For full documentation on working with Listing Variations, see Working with Variations."
 :fields
 ((:id "property_option_id" :visiblity :public :permission-scope nil
   :type "int" :description "The property option's unique ID")
  (:id "name" :visiblity :public :permission-scope nil :type "string"
   :description "property option name")
  (:id "formatted_name" :visiblity :public :permission-scope nil
   :type "string" :description
   "property option name, formatted for display"))
 :associations nil :methods
 ((:method-name "findAllSuggestedPropertyOptions" :synopsis
   "Finds all suggested property options for a given property."
   :http-method :get :method-uri "/property_options/suggested"
   :parameters
   ((:id "property_id" :required t :default nil :type "int")
    (:id "category_id" :required nil :default nil :type "int")
    (:id "recipient_id" :required nil :default nil :type "int")
    (:id "sizing_scale" :required nil :default nil :type "int")
    (:id "weight_scale" :required nil :default nil :type "int")
    (:id "height_scale" :required nil :default nil :type "int")
    (:id "length_scale" :required nil :default nil :type "int")
    (:id "width_scale" :required nil :default nil :type "int")
    (:id "diameter_scale" :required nil :default nil :type "int")
    (:id "dimensions_scale" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)))


:variations_propertysetoptionmodifier

(:name "Variations_PropertySetOptionModifier" :overview
 "Represents rules for display of Variations property options on Etsy, dependent on one or more qualifiers (size scale, recipient, etc.) The resource specified text that should come before and after the option.

When accessing existing Variations_Option records on Etsy listings, the field formatted_value will already have these display rules applied. This resource is only useful when adding new Variation options to listings, in order to preview the options as they will appear once saved.

NOTE: Support for Listing Variations is a beta feature. For full documentation on working with Listing Variations, see Working with Variations."
 :fields
 ((:id "prefix" :visiblity :public :permission-scope nil :type
   "string" :description
   "Indicates text that should be prepended to property options")
  (:id "suffix" :visiblity :public :permission-scope nil :type
   "string" :description
   "Indicates text that should be appended to property options"))
 :associations nil :methods
 ((:method-name "getPropertyOptionModifier" :synopsis
   "Add a value for a given property." :http-method :get :method-uri
   "/property_options/modifiers" :parameters
   ((:id "property_id" :required t :default nil :type "int")
    (:id "category_id" :required nil :default nil :type "int")
    (:id "recipient_id" :required nil :default nil :type "int")
    (:id "sizing_scale" :required nil :default nil :type "int")
    (:id "weight_scale" :required nil :default nil :type "int")
    (:id "height_scale" :required nil :default nil :type "int")
    (:id "length_scale" :required nil :default nil :type "int")
    (:id "width_scale" :required nil :default nil :type "int")
    (:id "diameter_scale" :required nil :default nil :type "int")
    (:id "dimensions_scale" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)))


:paymentadjustmentitem

(:name "PaymentAdjustmentItem" :overview
 "A Direct Checkout Payment may have adjustments, or refunds. These adjustments can have different items, associated with the area being refunded, like shipping, sales tax, or the item itself. Please note all monetary amounts are in USD pennies unless otherwise specified."
 :fields
 ((:id "payment_adjustment_item_id" :visiblity :private
   :permission-scope :transactions_r :type "int" :description
   "The payment adjustment item's numeric ID.")
  (:id "payment_adjustment_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The payment adjustment's numeric ID.")
  (:id "adjustment_type" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "A human readable string describing the area being refundedOne of: TRANS, TAX, or SHIP")
  (:id "amount" :visiblity :private :permission-scope :transactions_r
   :type "int" :description
   "The total amount of the payment adjustment item.")
  (:id "transaction_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The numerice ID of the Credit Card Transaction")
  (:id "create_date" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The date and time the payment adjustment item was created in Epoch seconds."))
 :associations nil :methods nil)


:featuredtreasury

(:name "FeaturedTreasury" :overview
 "Represents a Treasury list featured on Etsy homepage." :fields
 ((:id "treasury_id" :visiblity :public :permission-scope nil :type
   "int" :description "The numeric ID for this FeaturedTreasury.")
  (:id "treasury_owner_id" :visiblity :public :permission-scope nil
   :type "int" :description
   "The user ID of the FeaturedTreasury owner.")
  (:id "url" :visiblity :public :permission-scope nil :type "string"
   :description "The url to the FeaturedTreasury")
  (:id "region" :visiblity :public :permission-scope nil :type
   "string" :description
   "The region for which this FeaturedTreasury is active.")
  (:id "active_date" :visiblity :public :permission-scope nil :type
   "float" :description
   "The time this FeaturedTreasury is made active on the homepage"))
 :associations nil :methods
 ((:method-name "findAllFeaturedTreasuries" :synopsis
   "Finds all FeaturedTreasuries." :http-method :get :method-uri
   "/featured_treasuries" :parameters
   ((:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int")
    (:id "region" :required nil :default "__ALL_REGIONS__" :type
     "region"))
   :oauth? nil :pscope nil)
  (:method-name "getFeaturedTreasuryById" :synopsis
   "Finds FeaturedTreasury by numeric ID." :http-method :get
   :method-uri "/featured_treasuries/:featured_treasury_id"
   :parameters
   ((:id "featured_treasury_id" :required t :default nil :type
     "int"))
   :oauth? nil :pscope nil)
  (:method-name "findAllFeaturedTreasuriesByOwner" :synopsis
   "Finds all FeaturedTreasury by numeric owner_id." :http-method
   :get :method-uri "/featured_treasuries/owner/:owner_id"
   :parameters
   ((:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int")
    (:id "owner_id" :required t :default nil :type "int"))
   :oauth? nil :pscope nil)))


:variations_propertyset

(:name "Variations_PropertySet" :overview
 "When managing variations of a listing, a property set is a data structure that defines how a property is specified for a given category. For instance, the Size property requires varying degrees of specificity when describing Clothing: Pants as opposed to Jewelery: Rings; the additional specificity allows us to suggest more appropriate options — e.g. men’s UK pant sizes — for a given property. Properties and Property Sets describes in further detail how to interpret this data.

NOTE: Support for Listing Variations is a beta feature. For full documentation on working with Listing Variations, see Working with Variations."
 :fields
 ((:id "property_set_id" :visiblity :public :permission-scope nil
   :type "int" :description "Numeric ID of this property set")
  (:id "properties" :visiblity :public :permission-scope nil :type
   (map "int" "Variations_PropertySetProperty") :description
   "Dictionary of properties that are available as variations")
  (:id "qualifying_properties" :visiblity :public :permission-scope
   nil :type (map "int" "Variations_Property") :description
   "Dictionary of properties that are used to add specificity to one or more variation properties")
  (:id "options" :visiblity :public :permission-scope nil :type
   (map "int" "string") :description
   "Dictionary of available property options for any of the qualifying properties")
  (:id "qualifiers" :visiblity :public :permission-scope nil :type
   (map "int" "Variations_PropertyQualifier") :description
   "Recursive data-structure indicating the property options available for qualifying_properties, and the nested qualifiers available for each option"))
 :associations nil :methods
 ((:method-name "findPropertySet" :synopsis
   "Find the property set for the category id" :http-method :get
   :method-uri "/property_sets" :parameters
   ((:id "category_id" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)))


:category

(:name "Category" :overview "A category" :fields
 ((:id "category_id" :visiblity :public :permission-scope nil :type
   "int" :description "The identifier for this category.")
  (:id "name" :visiblity :public :permission-scope nil :type "string"
   :description "The programmatic name for this category.")
  (:id "meta_title" :visiblity :public :permission-scope nil :type
   "string" :description
   "The \"title\" meta tag value for the category's landing page (may be null).")
  (:id "meta_keywords" :visiblity :public :permission-scope nil :type
   "string" :description
   "The \"keywords\" meta tag value for the category's landing page (may be null).")
  (:id "meta_description" :visiblity :public :permission-scope nil
   :type "string" :description
   "The \"description\" meta tag value for the category's landing page (may be null).")
  (:id "page_description" :visiblity :public :permission-scope nil
   :type "string" :description
   "A short description of the category from the category' landing page (may be null).")
  (:id "page_title" :visiblity :public :permission-scope nil :type
   "string" :description
   "The title of the category's landing page (may be null).")
  (:id "category_name" :visiblity :public :permission-scope nil :type
   "string" :description "The category's string ID.")
  (:id "short_name" :visiblity :public :permission-scope nil :type
   "string" :description "A short display name for the category.")
  (:id "long_name" :visiblity :public :permission-scope nil :type
   "string" :description "A longer display name for the category.")
  (:id "num_children" :visiblity :public :permission-scope nil :type
   "int" :description
   "The number of subcategories below this one. Subcatgories append a new tag to the end of their parent's category_name."))
 :associations nil :methods
 ((:method-name "getCategory" :synopsis
   "Retrieves a top-level Category by tag." :http-method :get
   :method-uri "/categories/:tag" :parameters
   ((:id "tag" :required t :default nil :type "string")) :oauth? nil
   :pscope nil)
  (:method-name "findAllTopCategory" :synopsis
   "Retrieves all top-level Categories." :http-method :get
   :method-uri "/taxonomy/categories" :parameters nil :oauth? nil
   :pscope nil)
  (:method-name "getSubCategory" :synopsis
   "Retrieves a second-level Category by tag and subtag."
   :http-method :get :method-uri "/categories/:tag/:subtag"
   :parameters
   ((:id "tag" :required t :default nil :type "string")
    (:id "subtag" :required t :default nil :type "string"))
   :oauth? nil :pscope nil)
  (:method-name "getSubSubCategory" :synopsis
   "Retrieves a third-level Category by tag, subtag and subsubtag."
   :http-method :get :method-uri
   "/categories/:tag/:subtag/:subsubtag" :parameters
   ((:id "tag" :required t :default nil :type "string")
    (:id "subtag" :required t :default nil :type "string")
    (:id "subsubtag" :required t :default nil :type "string"))
   :oauth? nil :pscope nil)
  (:method-name "findAllTopCategoryChildren" :synopsis
   "Retrieves children of a top-level Category by tag." :http-method
   :get :method-uri "/taxonomy/categories/:tag" :parameters
   ((:id "tag" :required t :default nil :type "string")) :oauth? nil
   :pscope nil)
  (:method-name "findAllSubCategoryChildren" :synopsis
   "Retrieves children of a second-level Category by tag and subtag."
   :http-method :get :method-uri "/taxonomy/categories/:tag/:subtag"
   :parameters
   ((:id "tag" :required t :default nil :type "string")
    (:id "subtag" :required t :default nil :type "string"))
   :oauth? nil :pscope nil)))


:avatar

(:name "Avatar" :overview "An Etsy member's avatar image.

Supported Sizes[anchor]

The ListingImage resource includes fields for the following sizes, which be officially supported by Etsy at least through the end of 2013:

   Size                   Where We Use It
75x75       small thumbnail
170x135     homepage, treasuries, shop listings
570xN       listing page
fullxfull   listing page zoom

Additional sizes are available but do not have specific fields in the resource. Instead, treat the full size URL as a template. Use the ImageType methods to retrieve available sizes for listing images; any of these can be subsituted in place of \"fullxfull\" in the full size URL to make a new URL for the listing image of that size.

The 570xN and fullxfull image sizes have variable dimensions depending on the original artwork uploaded by the seller:

  • For the 570xN size, the horizontal dimension will be the original artwork's horizontal size, or 570 pixels, whichever is smaller. Likewise for all other *xN images
  • For the fullxfull size, the horizontal dimension will be the original artwork's horizontal size, or 1500 pixels, whichever is smaller.
  • These sizes will have a variable vertical dimension, dependent on the original artwork's aspect ratio.

Resizing, Cropping and Caching Images[anchor]

If the provided sizes don't suit your application, you are free to download the larger image sizes, resize and cache them for your own use, as long as you adhere to our API Terms of Use.

Uploading Images[anchor]

Image uploads can be performed using a POST request with the Content-Type: multipart/form-dataheader, following RFC1867. This is identical to using curl -F, except that that request needs to be signed using OAuth.

Your OAuth toolkit must support multipart form uploads as described above. Here is example code for PHP using the PECL OAuth 1.1 extension (PECL OAuth 1.0 will not work):

// You must define the constants OAUTH_CONSUMER_KEY and OAUTH_CONSUMER_SECRET
// You must also assign values to the variables $access_token, $access_token_secret,
// $listing_id and $filename, and $mimetype.
// Your image file is assumed to be in the same directory as this code.

$oauth = new OAuth(OAUTH_CONSUMER_KEY, OAUTH_CONSUMER_SECRET);

$oauth->enableDebug();
$oauth->setToken($access_token, $access_token_secret);

try {
    $source_file = dirname(realpath(__FILE__)) .\"/$filename\";

    $url = \"http://openapi.etsy.com/v2/listings/\".$listing_id.\"/images\";
    $params = array('@image' => '@'.$source_file.';type='.$mimetype);

    $oauth->fetch($url, $params, OAUTH_HTTP_METHOD_POST);

    $json = $oauth->getLastResponse();
    print_r(json_decode($json, true));

} catch (OAuthException $e) {
    // You may want to recover gracefully here...
    print $oauth->getLastResponse().\"\\n\";
    print_r($oauth->debugInfo);
    die($e->getMessage());
}"
 :fields
 ((:id "avatar_id" :visiblity :public :permission-scope nil :type
   "int" :description "The numeric ID for this avatar image.")
  (:id "hex_code" :visiblity :public :permission-scope nil :type
   "string" :description
   "The avatar' average RGB color, in webhex notation.")
  (:id "red" :visiblity :public :permission-scope nil :type "int"
   :description
   "The avatar's average red channel (RGB color) value from 0-255.")
  (:id "green" :visiblity :public :permission-scope nil :type "int"
   :description
   "The avatar's average green channel (RGB color) value from 0-255.")
  (:id "blue" :visiblity :public :permission-scope nil :type "int"
   :description
   "The avatar's average blue channel (RGB color) value from 0-255.")
  (:id "hue" :visiblity :public :permission-scope nil :type "int"
   :description "The avatar's average hue (HSV color) from 0-360.")
  (:id "saturation" :visiblity :public :permission-scope nil :type
   "int" :description
   "The avatar's average saturation (HSV color) from 0-100.")
  (:id "brightness" :visiblity :public :permission-scope nil :type
   "int" :description
   "The avatar's average brightness (HSV color) from 0-100.")
  (:id "is_black_and_white" :visiblity :public :permission-scope nil
   :type "boolean" :description
   "True if the avatar is a black and white image.")
  (:id "creation_tsz" :visiblity :public :permission-scope nil :type
   "float" :description "The time that the avatar was uploaded.")
  (:id "user_id" :visiblity :public :permission-scope nil :type "int"
   :description "The numeric ID of the user who owns the avatar."))
 :associations nil :methods nil)


:shopsectiontranslation

(:name "ShopSectionTranslation" :overview
 "Represents the translation data for a ShopSection." :fields
 ((:id "shop_section_id" :visiblity :public :permission-scope nil
   :type "int" :description "The numeric ID for the ShopSection.")
  (:id "language" :visiblity :public :permission-scope nil :type
   "language" :description
   "The IETF language tag (e.g. 'fr') for the language of this translation.")
  (:id "title" :visiblity :public :permission-scope nil :type
   "string" :description "Translation of title of ShopSection."))
 :associations
 ((:id "ShopSection" :visiblity :public :permission-scope nil :type
   "ShopSection" :description
   "The ShopSection this translation belongs to."))
 :methods
 ((:method-name "getShopSectionTranslation" :synopsis
   "Retrieves a ShopSectionTranslation by shop_id, shop_section_id and language"
   :http-method :get :method-uri
   "/shops/:shop_id/sections/:shop_section_id/translations/:language"
   :parameters
   ((:id "shop_id" :required t :default nil :type "shop_id_or_name")
    (:id "shop_section_id" :required t :default nil :type "int")
    (:id "language" :required t :default nil :type "language"))
   :oauth? nil :pscope nil)))


:paymenttemplate

(:name "PaymentTemplate" :overview "A payment template for a user."
 :fields
 ((:id "payment_template_id" :visiblity :public :permission-scope nil
   :type "int" :description
   "The numeric ID for this payment template")
  (:id "allow_bt" :visiblity :public :permission-scope nil :type
   "boolean" :description
   "True if the seller accepts bank transfers for payment")
  (:id "allow_check" :visiblity :public :permission-scope nil :type
   "boolean" :description
   "True if the seller accepts checks for payment")
  (:id "allow_mo" :visiblity :public :permission-scope nil :type
   "boolean" :description
   "True if the seller accepts money order payments")
  (:id "allow_other" :visiblity :public :permission-scope nil :type
   "boolean" :description
   "True if the seller accepts other payments")
  (:id "allow_paypal" :visiblity :public :permission-scope nil :type
   "boolean" :description "True if the seller accepts paypal")
  (:id "allow_cc" :visiblity :public :permission-scope nil :type
   "boolean" :description "True if the seller accepts credit cards")
  (:id "paypal_email" :visiblity :private :permission-scope
   :listings_r :type "string" :description
   "The users paypal email address.")
  (:id "name" :visiblity :private :permission-scope :listings_r :type
   "string" :description "The name of the seller.")
  (:id "first_line" :visiblity :private :permission-scope :listings_r
   :type "string" :description
   "The first line of the seller's address.")
  (:id "second_line" :visiblity :private :permission-scope
   :listings_r :type "string" :description
   "The second line of the seller's address.")
  (:id "city" :visiblity :private :permission-scope :listings_r :type
   "string" :description "The seller's city.")
  (:id "state" :visiblity :private :permission-scope :listings_r
   :type "string" :description "The seller's state.")
  (:id "zip" :visiblity :private :permission-scope :listings_r :type
   "string" :description "The seller's zip code.")
  (:id "country_id" :visiblity :private :permission-scope :listings_r
   :type "int" :description "The seller's country.")
  (:id "user_id" :visiblity :private :permission-scope :listings_r
   :type "int" :description "The user's numeric ID.")
  (:id "listing_payment_id" :visiblity :public :permission-scope nil
   :type "int" :description
   "Provided for backward compatibility to ListingPayment. This will return the same value as payment_template_id."))
 :associations
 ((:id "Country" :visiblity :private :permission-scope :listings_r
   :type "Country" :description
   "The full Country record of the shop's country.")
  (:id "User" :visiblity :private :permission-scope :listings_r :type
   "User" :description "The User that owns this payment template"))
 :methods nil)


:datatype

(:name "DataType" :overview "Describes an input type." :fields
 ((:id "type" :visiblity :public :permission-scope nil :type "string"
   :description "Base type of data")
  (:id "values" :visiblity :public :permission-scope nil :type
   (array-of "string") :description
   "Allowable values (for an enum.)"))
 :associations nil :methods
 ((:method-name "describeOccasionEnum" :synopsis
   "Describes the legal values for Listing.occasion." :http-method
   :get :method-uri "/types/enum/occasion" :parameters nil :oauth?
   nil :pscope nil)
  (:method-name "describeRecipientEnum" :synopsis
   "Describes the legal values for Listing.recipient." :http-method
   :get :method-uri "/types/enum/recipient" :parameters nil :oauth?
   nil :pscope nil)
  (:method-name "describeWhenMadeEnum" :synopsis
   "Describes the legal values for Listing.when_made." :http-method
   :get :method-uri "/types/enum/when_made" :parameters
   ((:id "include_formatted" :required nil :default nil :type
     "boolean"))
   :oauth? nil :pscope nil)
  (:method-name "describeWhoMadeEnum" :synopsis
   "Describes the legal values for Listing.who_made." :http-method
   :get :method-uri "/types/enum/who_made" :parameters nil :oauth?
   nil :pscope nil)))


:treasury

(:name "Treasury" :overview
 "The Treasury is an ever-changing, member-curated shopping gallery comprised of lists of items. The Etsy API allows you to retrieve, create, edit, and delete treasury lists. When retrieving multiple lists with findAllTreasuries method, you are limited to the 25,000 sortable hottest lists in the Treasury at that time. If you need to retrieve a specific list, be sure to use the getTreasury method with the corresponding treasury key."
 :fields
 ((:id "id" :visiblity :public :permission-scope nil :type "string"
   :description "Unique id of the collection")
  (:id "title" :visiblity :public :permission-scope nil :type
   "string" :description "Title of the collection")
  (:id "description" :visiblity :public :permission-scope nil :type
   "string" :description "Description of the collection")
  (:id "homepage" :visiblity :public :permission-scope nil :type
   "int" :description
   "If the Treasury was featured on the homepage, the time in seconds since the epoch that it was featured")
  (:id "mature" :visiblity :public :permission-scope nil :type
   "boolean" :description
   "Whether the Treasury has been flagged mature or not")
  (:id "private" :visiblity :public :permission-scope nil :type
   "boolean" :description
   "Whether the Treasury has been set to private")
  (:id "locale" :visiblity :public :permission-scope nil :type
   "string" :description "Language/Locale of the collection")
  (:id "comment_count" :visiblity :public :permission-scope nil :type
   "int" :description "The number of comments on this Treasury")
  (:id "tags" :visiblity :public :permission-scope nil :type
   (array-of "string") :description
   "The tags associated with this Treasury")
  (:id "counts" :visiblity :public :permission-scope nil :type
   "TreasuryCounts" :description
   "Clicks, views, shares, and reports metrics of this collection")
  (:id "hotness" :visiblity :public :permission-scope nil :type
   "float" :description
   "The algorithmic ranking value assigned to this collection")
  (:id "hotness_color" :visiblity :public :permission-scope nil :type
   "string" :description
   "The algorithmic ranking value shown as a color (color hexadecimal)")
  (:id "user_id" :visiblity :public :permission-scope nil :type "int"
   :description "ID of the user (curator) of the collection")
  (:id "user_name" :visiblity :public :permission-scope nil :type
   "string" :description
   "Name of the user (curator) of the collection")
  (:id "user_avatar_id" :visiblity :public :permission-scope nil
   :type "int" :description "ID of the user's (curator's) avatar")
  (:id "listings" :visiblity :public :permission-scope nil :type
   (array-of "TreasuryListing") :description
   "The listings that are in this collection")
  (:id "creation_tsz" :visiblity :public :permission-scope nil :type
   "float" :description
   "Time this collection was created, in epoch seconds"))
 :associations nil :methods
 ((:method-name "findAllTreasuries" :synopsis
   "Search Treasuries or else List all Treasuries" :http-method :get
   :method-uri "/treasuries" :parameters
   ((:id "keywords" :required nil :default nil :type
     "treasury_search_string")
    (:id "sort_on" :required nil :default "hotness" :type
     (enum "hotness" "created"))
    (:id "sort_order" :required nil :default "down" :type
     (enum "up" "down"))
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)))


:variations_selectedproperty

(:name "Variations_SelectedProperty" :overview
 "A data structure representing a buyer's selected variation for a listing. Returned as a collection as a property on CartListing and Transaction.

When in the context of a CartListing, special attention should be paid to the is_valid property. This will be false in the event that the variation has been changed or removed since the listing was added to the cart. Additionally, the purchase_state property of the parent CartListing will have a value of edited to signal this state. In this case the listing needs to be removed and re-added to the cart with a valid variation.

NOTE: Support for Listing Variations is a beta feature. For full documentation on working with Listing Variations, see Working with Variations."
 :fields
 ((:id "property_id" :visiblity :public :permission-scope nil :type
   "int" :description "The numeric ID of the selected property")
  (:id "value_id" :visiblity :public :permission-scope nil :type
   "int" :description "The numeric ID of selected value")
  (:id "formatted_name" :visiblity :public :permission-scope nil
   :type "string" :description
   "The formatted/translated name of the selected property")
  (:id "formatted_value" :visiblity :public :permission-scope nil
   :type "string" :description
   "The formatted/translated name of the selected value")
  (:id "is_valid" :visiblity :public :permission-scope nil :type
   "boolean" :description
   "Whether the selected variation value is a valid option for this property. NOTE: This field will not be present on Transactions."))
 :associations nil :methods nil)


:guest

(:name "Guest" :overview
 "A Guest represents an anonymous user that is using the Etsy API that has not yet authenticated, but may wish to store some information before authenticating (currently, guest carts). Guests are identified via a random 13-digit hash, which is unique to every Application. Important: This guest ID is associated directly to your Application, and will not be accessible through other API keys. Although Guests do not require an authenticated user, they do require your app to have production access in order to be interacted with. Please use the sandbox to test your app and apply for production access when you've got an application ready for public use."
 :fields
 ((:id "guest_id" :visiblity :public :permission-scope nil :type
   "guest_id" :description
   "The ID that associates to the guest - a random 13-digit hash. Validated by the regular expression '/^[a-zA-Z0-9-_]+$/'. Each ID is identified internally to the Application that created it, meaning that other applications will not have access to this guest, even with the same ID.")
  (:id "checkout_url" :visiblity :public :permission-scope nil :type
   "string" :description
   "The URL to send the user's browser to on checkout. This will allow them to use this guest ID to check out with the carts associated. Please note that a guest cart's data are undefined after being merged on checkout."))
 :associations nil :methods
 ((:method-name "getGuest" :synopsis "Get a guest by ID."
   :http-method :get :method-uri "/guests/:guest_id" :parameters
   ((:id "guest_id" :required t :default nil :type "guest_id"))
   :oauth? nil :pscope nil)
  (:method-name "generateGuest" :synopsis
   "A helper method that generates a Guest ID to associate to this anonymous session. This method is not strictly necessary, as any sufficiently random guest ID that is 13 characters in length will suffice and automatically create a guest account on use if it does not yet exist."
   :http-method :get :method-uri "/guests/generator" :parameters nil
   :oauth? nil :pscope nil)))


:favoriteuser

(:name "FavoriteUser" :overview
 "Represents the association between a user and another user they've marked as favorite."
 :fields
 ((:id "user_id" :visiblity :public/private :permission-scope
   :favorites_rw :type "int" :description
   "The user's numeric ID. Note: This field may be absent, depending on the user's privacy settings.")
  (:id "favorite_user_id" :visiblity :public :permission-scope nil
   :type "int" :description
   "(DEPRECATED - do not use) The numberic ID of this favorite user association.")
  (:id "target_user_id" :visiblity :public :permission-scope nil
   :type "int" :description
   "The targeted favorite user's numeric ID.")
  (:id "creation_tsz" :visiblity :public :permission-scope nil :type
   "float" :description
   "The date and time that the user was favorited."))
 :associations
 ((:id "User" :visiblity :public/private :permission-scope
   :favorites_rw :type "User" :description
   "The user who marked the target user as a favorite. Note: This field may be absent, depending on the user's privacy settings.")
  (:id "TargetUser" :visiblity :public :permission-scope nil :type
   "User" :description "The user who was marked as a favorite."))
 :methods
 ((:method-name "findAllUserFavoredBy" :synopsis
   "Retrieves a set of FavoriteUser objects associated to a User."
   :http-method :get :method-uri "/users/:user_id/favored-by"
   :parameters
   ((:id "user_id" :required t :default nil :type "user_id_or_name")
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)
  (:method-name "findAllUserFavoriteUsers" :synopsis
   "Finds all favorite users for a user" :http-method :get
   :method-uri "/users/:user_id/favorites/users" :parameters
   ((:id "user_id" :required t :default nil :type "user_id_or_name")
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)
  (:method-name "findUserFavoriteUsers" :synopsis
   "Finds a favorite user for a user" :http-method :get :method-uri
   "/users/:user_id/favorites/users/:target_user_id" :parameters
   ((:id "user_id" :required t :default nil :type "user_id_or_name")
    (:id "target_user_id" :required t :default nil :type
     "user_id_or_name"))
   :oauth? nil :pscope nil)))


:listingtranslation

(:name "ListingTranslation" :overview
 "Represents the translation data for a Listing." :fields
 ((:id "listing_id" :visiblity :public :permission-scope nil :type
   "int" :description "The numeric ID for the Listing.")
  (:id "language" :visiblity :public :permission-scope nil :type
   "language" :description
   "The IETF language tag (e.g. 'fr') for the language of this translation.")
  (:id "title" :visiblity :public :permission-scope nil :type
   "string" :description
   "The title of the Listing of this Translation.")
  (:id "description" :visiblity :public :permission-scope nil :type
   "string" :description
   "The description of the Listing of this Translation.")
  (:id "tags" :visiblity :public :permission-scope nil :type
   (array-of "string") :description
   "The description of the Listing of this Translation."))
 :associations nil :methods
 ((:method-name "getListingTranslation" :synopsis
   "Retrieves a ListingTranslation by listing_id and language"
   :http-method :get :method-uri
   "/listings/:listing_id/translations/:language" :parameters
   ((:id "listing_id" :required t :default nil :type "int")
    (:id "language" :required t :default nil :type "language"))
   :oauth? nil :pscope nil)))


:guestcart

(:name "GuestCart" :overview
 "Represents a guest shopping cart on Etsy. Users have one cart per shop.

This is a cart that is not yet associated to a single user, but to a guest ID for tracking purposes. Some important things to note about Guest Carts:

  • Each GuestID generated is associated only with the application that generated it. You may not access a guest's carts from multiple different applications.
  • Although Guest Carts do not require an authenticated user, they do require your app to have production access in order to be interacted with. Please use the sandbox to test your app and apply for production access when you've got an application ready for public use.
  • Guest Carts expire after 30 days of inactivity. Do not rely on a guest cart existing permanently, as they will be emptied and reset after those 30 days."
 :fields
 ((:id "cart_id" :visiblity :public :permission-scope nil :type "int"
   :description "The numeric ID of the cart")
  (:id "shop_name" :visiblity :public :permission-scope nil :type
   "string" :description "The shop name")
  (:id "message_to_seller" :visiblity :public :permission-scope nil
   :type "string" :description "The message to the seller")
  (:id "destination_country_id" :visiblity :public :permission-scope
   nil :type "int" :description
   "The numeric ID of the destination country")
  (:id "coupon_code" :visiblity :public :permission-scope nil :type
   "string" :description
   "The alphanumeric coupon code applied to the cart")
  (:id "currency_code" :visiblity :public :permission-scope nil :type
   "string" :description
   "The ISO (alphabetic) code for the currency")
  (:id "total" :visiblity :public :permission-scope nil :type
   "string" :description "The total price")
  (:id "subtotal" :visiblity :public :permission-scope nil :type
   "string" :description "The subtotal price")
  (:id "shipping_cost" :visiblity :public :permission-scope nil :type
   "string" :description "The shipping cost")
  (:id "tax_cost" :visiblity :public :permission-scope nil :type
   "string" :description "The tax cost")
  (:id "discount_amount" :visiblity :public :permission-scope nil
   :type "string" :description
   "The line-item discount amount (does not include tax or shipping)")
  (:id "shipping_discount_amount" :visiblity :public
   :permission-scope nil :type "string" :description
   "The shipping discount amount")
  (:id "tax_discount_amount" :visiblity :public :permission-scope nil
   :type "string" :description "The tax discount amount")
  (:id "url" :visiblity :public :permission-scope nil :type "string"
   :description "The full URL to the cart page on Etsy")
  (:id "listings" :visiblity :public :permission-scope nil :type
   (array-of "CartListing") :description
   "An array of purchase information for the listings"))
 :associations
 ((:id "Shop" :visiblity :public :permission-scope nil :type "Shop"
   :description "The shop")
  (:id "Listings" :visiblity :public :permission-scope nil :type
   (array-of "Listing") :description "An array of listings")
  (:id "Coupon" :visiblity :public :permission-scope nil :type
   "Coupon" :description "The coupon applied to the cart"))
 :methods
 ((:method-name "findAllGuestCarts" :synopsis "Get all guest's carts"
   :http-method :get :method-uri "/guests/:guest_id/carts"
   :parameters
   ((:id "guest_id" :required t :default nil :type "guest_id"))
   :oauth? nil :pscope nil)))


:shopaboutimage

(:name "ShopAboutImage" :overview "Data about a user's shop" :fields
 ((:id "shop_id" :visiblity :public :permission-scope nil :type "int"
   :description "Numeric ID of the shop")
  (:id "image_id" :visiblity :public :permission-scope nil :type
   "int" :description "Numeric ID of the image record")
  (:id "caption" :visiblity :public :permission-scope nil :type
   "string" :description "Description of this ShopAboutImage")
  (:id "rank" :visiblity :public :permission-scope nil :type "int"
   :description "The order of this image in a list")
  (:id "url_178x178" :visiblity :public :permission-scope nil :type
   "string" :description
   "The url to a thumbnail of the image, exactly 178px by 178px.")
  (:id "url_545xN" :visiblity :public :permission-scope nil :type
   "string" :description
   "The url to a thumbnail of the image, no more than 545px width by variable height.")
  (:id "url_760xN" :visiblity :public :permission-scope nil :type
   "string" :description
   "The url to a thumbnail of the image, no more than 760px width by variable height.")
  (:id "url_fullxfull" :visiblity :public :permission-scope nil :type
   "string" :description
   "The url to the full-size image, no more than 1500px width by variable height."))
 :associations nil :methods nil)


:variations_option

(:name "Variations_Option" :overview
 "Represents an available listing variation option — e.g. Small for the Size property. Options are often provided as a collection of the Variations_Property resource.

NOTE: Support for Listing Variations is a beta feature. For full documentation on working with Listing Variations, see Working with Variations."
 :fields
 ((:id "value_id" :visiblity :public :permission-scope nil :type
   "int" :description "The numeric ID of the option")
  (:id "value" :visiblity :public :permission-scope nil :type
   "string" :description "The normalized value of the option")
  (:id "formatted_value" :visiblity :public :permission-scope nil
   :type "string" :description
   "The formatted/translated value of the option"))
 :associations nil :methods nil)


:billingoverview

(:name "BillingOverview" :overview
 "A user's account balance on Etsy." :fields
 ((:id "is_overdue" :visiblity :private :permission-scope :billing_r
   :type "boolean" :description
   "True if the user has an overdue balance.")
  (:id "currency_code" :visiblity :private :permission-scope
   :billing_r :type "string" :description
   "The currency unit in which the user is billed.")
  (:id "overdue_balance" :visiblity :private :permission-scope
   :billing_r :type "float" :description
   "The total overdue balance owed by the user.")
  (:id "balance_due" :visiblity :private :permission-scope :billing_r
   :type "float" :description
   "The total amount currently due for payment (including any overdue balance.)")
  (:id "total_balance" :visiblity :private :permission-scope
   :billing_r :type "float" :description
   "The total amount owed by the user (including fees that are not yet due for payment.)")
  (:id "date_due" :visiblity :private :permission-scope :billing_r
   :type "epoch" :description
   "The date by which the user's balance due must be paid.")
  (:id "date_overdue" :visiblity :private :permission-scope
   :billing_r :type "epoch" :description
   "The date on which the user's balance became overdue."))
 :associations nil :methods nil)


:paymentadjustment

(:name "PaymentAdjustment" :overview
 "Represents refund on a Direct Checkout Payment. Please note all monetary amounts are in USD pennies unless otherwise specified."
 :fields
 ((:id "payment_adjustment_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The payment adjustment's numeric ID.")
  (:id "payment_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The payment's numeric ID.")
  (:id "status" :visiblity :private :permission-scope :transactions_r
   :type "string" :description
   "The status of the Payment Adjustment. Can be OPEN, REFUNDED, ERROR, or REFUND_FAILED.")
  (:id "user_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The seller's numeric ID.")
  (:id "reason_code" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "A human-readable string describing the need for the refund.")
  (:id "total_adjustment_amount" :visiblity :private
   :permission-scope :transactions_r :type "int" :description
   "The total amount of the refund.")
  (:id "total_fee_adjustment_amount" :visiblity :private
   :permission-scope :transactions_r :type "int" :description
   "The amount of card processing fees associated with this adjustment.")
  (:id "create_date" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The date and time the payment adjustment was created in Epoch seconds.")
  (:id "update_date" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The date and time the payment adjustment was last updated in Epoch seconds."))
 :associations nil :methods nil)


:treasurylistingdata

(:name "TreasuryListingData" :overview
 "The detailed fields of a TreasuryListing" :fields
 ((:id "user_id" :visiblity :public :permission-scope nil :type "int"
   :description "The numeric ID of the user who posted the item")
  (:id "title" :visiblity :public :permission-scope nil :type
   "string" :description "The listing's title")
  (:id "price" :visiblity :public :permission-scope nil :type "float"
   :description "The item's price (private for sold listings)")
  (:id "currency_code" :visiblity :public :permission-scope nil :type
   "string" :description
   "The ISO (alphabetic) code for the listing's currency")
  (:id "listing_id" :visiblity :public :permission-scope nil :type
   "int" :description "The ID of the listing")
  (:id "state" :visiblity :public :permission-scope nil :type
   "string" :description "Whether the listing is active or not")
  (:id "shop_name" :visiblity :public :permission-scope nil :type
   "string" :description "The shop to which the listing belongs")
  (:id "image_id" :visiblity :public :permission-scope nil :type
   "int" :description "The ID of the main image of the listing")
  (:id "image_url_75x75" :visiblity :public :permission-scope nil
   :type "string" :description
   "The url to a 75x75 thumbnail of the main image.")
  (:id "image_url_170x135" :visiblity :public :permission-scope nil
   :type "string" :description
   "The url to a 170x135 thumbnail of the main image."))
 :associations nil :methods nil)


:treasurylisting

(:name "TreasuryListing" :overview
 "A subset of the Listing resource stored in a Treasury" :fields
 ((:id "data" :visiblity :public :permission-scope nil :type
   "TreasuryListingData" :description
   "The detailed fields of the listing")
  (:id "creation_tsz" :visiblity :public :permission-scope nil :type
   "float" :description
   "Time the listing was added to this Treasury, in epoch seconds"))
 :associations nil :methods nil)


:segment

(:name "Segment" :overview
 "A Marketplace Browse Segment - The model which maps to the hierarchical marketplace segment names visible on the left side of Etsy.com and inside of pages starting with /browse. More information is in this Etsy News Blog post."
 :fields
 ((:id "name" :visiblity :public :permission-scope nil :type "string"
   :description "The formatted name for this Segment")
  (:id "path" :visiblity :public :permission-scope nil :type "string"
   :description
   "The sequence of slugified names leading up to (and including) this Segment, separated by period characters")
  (:id "short_name" :visiblity :public :permission-scope nil :type
   "string" :description "The slugified name of this Segment")
  (:id "has_children" :visiblity :public :permission-scope nil :type
   "boolean" :description
   "Whether this Segment has more Segments under it")
  (:id "image_url" :visiblity :public :permission-scope nil :type
   "string" :description
   "(Optional) A fullxfull image representing this Segment")
  (:id "shop_id" :visiblity :public :permission-scope nil :type "int"
   :description
   "(Optional) The shop_id of the Shop from which the image_url was chosen")
  (:id "shop_name" :visiblity :public :permission-scope nil :type
   "int" :description
   "(Optional) The name of the Shop from which the image_url was chosen"))
 :associations nil :methods
 ((:method-name "findBrowseSegments" :synopsis
   "Find all Browse Segments" :http-method :get :method-uri
   "/segments" :parameters
   ((:id "region" :required nil :default "US" :type "string")
    (:id "path" :required nil :default nil :type "string"))
   :oauth? nil :pscope nil)))


:variations_propertysetproperty

(:name "Variations_PropertySetProperty" :overview
 "Represents a suggested Variations property as part of a set of suggested properties and options, dependent on one or more qualifiers (size scale, recipient, etc.) For more information, see Variations_PropertySet.

Although Etsy listings can contain any value for any available property, it's recommended to use these suggested properties whenever possible. They may be integrated into Etsy search at a later date.

NOTE: Support for Listing Variations is a beta feature. For full documentation on working with Listing Variations, see Working with Variations."
 :fields
 ((:id "property_id" :visiblity :public :permission-scope nil :type
   "int" :description "This numeric ID of this property")
  (:id "name" :visiblity :public :permission-scope nil :type "string"
   :description "The name of this property")
  (:id "input_name" :visiblity :public :permission-scope nil :type
   "string" :description "Suggested form field name")
  (:id "label" :visiblity :public :permission-scope nil :type
   "string" :description "Descriptive text label for form input")
  (:id "param" :visiblity :public :permission-scope nil :type
   "string" :description
   "Specifies the qualifier parameter when requesting suggested options for a property")
  (:id "default_option" :visiblity :public :permission-scope nil
   :type "string" :description "Initial option value for form input")
  (:id "description" :visiblity :public :permission-scope nil :type
   "string" :description "Text description of property")
  (:id "is_custom" :visiblity :public :permission-scope nil :type
   "string" :description
   "True if this property is Custom 1 or Custom 2")
  (:id "title" :visiblity :public :permission-scope nil :type
   "string" :description "Property name, formatted for display"))
 :associations nil :methods nil)


:shopsection

(:name "ShopSection" :overview "A section within a user's shop."
 :fields
 ((:id "shop_section_id" :visiblity :public :permission-scope nil
   :type "int" :description "The numeric ID of the shop section.")
  (:id "title" :visiblity :public :permission-scope nil :type
   "string" :description "The title of the section.")
  (:id "rank" :visiblity :public :permission-scope nil :type "int"
   :description "Display order.")
  (:id "user_id" :visiblity :public :permission-scope nil :type "int"
   :description "The ID of the user who owns this shop section.")
  (:id "active_listing_count" :visiblity :public :permission-scope
   nil :type "int" :description
   "The number of active listings currently in the section."))
 :associations
 ((:id "Shop" :visiblity :public :permission-scope nil :type "Shop"
   :description "The shop to which this section belongs.")
  (:id "Listings" :visiblity :public :permission-scope nil :type
   (array-of "Listing") :description
   "An array of listings in this section.")
  (:id "Translations" :visiblity :public :permission-scope nil :type
   (array-of "ShopSectionTranslation") :description
   "An array of translations for this ShopSection."))
 :methods
 ((:method-name "findAllShopSections" :synopsis
   "Retrieves a set of ShopSection objects associated to a Shop."
   :http-method :get :method-uri "/shops/:shop_id/sections"
   :parameters
   ((:id "shop_id" :required t :default nil :type "shop_id_or_name"))
   :oauth? nil :pscope nil)))


:paramlist

(:name "ParamList" :overview
 "This is an associative array that maps parameter names to types. It has a varying number of fields with differing names."
 :fields
 ((:id "param_name" :visiblity :public :permission-scope nil :type
   "string" :description
   "Each field in the record represents an Etsy API method parameter. The value corresponds to one of the documented data or resource types."))
 :associations nil :methods nil)


:feedbackinfo

(:name "FeedbackInfo" :overview
 "An array representing the percentage of positive feedback this user has earned. This is returned in the feedback_info field of the User resource."
 :fields
 ((:id "count" :visiblity :public :permission-scope nil :type "int"
   :description "The number of feedbacks.")
  (:id "score" :visiblity :public :permission-scope nil :type "int"
   :description "The feedback score percentage."))
 :associations nil :methods nil)


:treasurycounts

(:name "TreasuryCounts" :overview "Various metrics on the Treasury"
 :fields
 ((:id "clicks" :visiblity :public :permission-scope nil :type "int"
   :description
   "The number of times the Treasury has been clicked on")
  (:id "views" :visiblity :public :permission-scope nil :type "int"
   :description "The number of times the Treasury has been viewed")
  (:id "shares" :visiblity :public :permission-scope nil :type "int"
   :description "The number of times the Treasury has been shared")
  (:id "reports" :visiblity :public :permission-scope nil :type "int"
   :description
   "The number of times the Treasury has been reported"))
 :associations nil :methods nil)


:cartlisting

(:name "CartListing" :overview
 "Represents the purchase quantity and state for a cart listing."
 :fields
 ((:id "listing_id" :visiblity :private :permission-scope :cart_rw
   :type "int" :description "The numeric ID of the listing")
  (:id "purchase_quantity" :visiblity :private :permission-scope
   :cart_rw :type "int" :description
   "The quantity of the listing being purchased")
  (:id "purchase_state" :visiblity :private :permission-scope
   :cart_rw :type "string" :description
   "The purchase state of the listing, possible values: valid, invalid_quantity, invalid_shipping, not_active, edited, invalid_currency, invalid_shipping_currency")
  (:id "listing_customization_id" :visiblity :private
   :permission-scope :cart_rw :type "int" :description
   "When Variations are present on a listing, this can be used to differentiate multiple instances of the same listing. (NOTE: this is a beta feature.)")
  (:id "variations_available" :visiblity :private :permission-scope
   :cart_rw :type "boolean" :description
   "Whether Variations are available for this listing. (NOTE: this is a beta feature.)")
  (:id "has_variations" :visiblity :private :permission-scope
   :cart_rw :type "boolean" :description
   "Whether the buyer selected Variations for this listing. (NOTE: this is a beta feature.)")
  (:id "selected_variations" :visiblity :private :permission-scope
   :cart_rw :type (array-of "Variations_SelectedProperty")
   :description
   "An array of selected Variations for this listing. (NOTE: this is a beta feature.)"))
 :associations nil :methods nil)


:forumpost

(:name "ForumPost" :overview "A post from the forums." :fields
 ((:id "thread_id" :visiblity :public :permission-scope nil :type
   "int" :description "Unique identifier of the thread")
  (:id "post_id" :visiblity :public :permission-scope nil :type "int"
   :description "Id of the individual post")
  (:id "post" :visiblity :public :permission-scope nil :type "string"
   :description "The content of the post")
  (:id "user_id" :visiblity :public :permission-scope nil :type
   "string" :description "Id of the user who created the post")
  (:id "last_edit_time" :visiblity :public :permission-scope nil
   :type "int" :description "When the post was last edited")
  (:id "create_date" :visiblity :public :permission-scope nil :type
   "int" :description "When the post was created"))
 :associations nil :methods
 ((:method-name "findTreasuryComments" :synopsis
   "Get a Treasury's Comments" :http-method :get :method-uri
   "/treasuries/:treasury_key/comments" :parameters
   ((:id "treasury_key" :required t :default nil :type "treasury_id")
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)))


:user

(:name "User" :overview "Represents a single user of the site."
 :fields
 ((:id "user_id" :visiblity :public :permission-scope nil :type "int"
   :description
   "The user's numeric ID. This is also valid as the user's shop ID.")
  (:id "login_name" :visiblity :public :permission-scope nil :type
   "string" :description "The user's login name.")
  (:id "primary_email" :visiblity :private :permission-scope :email_r
   :type "string" :description "The user's primary email address.")
  (:id "creation_tsz" :visiblity :public :permission-scope nil :type
   "float" :description
   "The date and time the user was created, in epoch seconds.")
  (:id "referred_by_user_id" :visiblity :public :permission-scope nil
   :type "int" :description
   "The numeric ID of the user that referred this user.")
  (:id "feedback_info" :visiblity :public :permission-scope nil :type
   "FeedbackInfo" :description
   "An associative array of feedback totals for the user."))
 :associations
 ((:id "Shops" :visiblity :public :permission-scope nil :type
   (array-of "Shop") :description
   "An array of shops that belong to the user.")
  (:id "Profile" :visiblity :public :permission-scope nil :type
   "UserProfile" :description "The user's public profile.")
  (:id "Orders" :visiblity :private :permission-scope :transactions_r
   :type (array-of "Order") :description
   "An array of orders this user has placed.")
  (:id "BuyerReceipts" :visiblity :private :permission-scope
   :transactions_r :type (array-of "Receipt") :description
   "An array of receipts for listings this user has purchased.")
  (:id "BuyerTransactions" :visiblity :private :permission-scope
   :transactions_r :type (array-of "Transaction") :description
   "An array of transactions (sold listings) this user has purchased.")
  (:id "Addresses" :visiblity :private :permission-scope :profile_r
   :type (array-of "UserAddress") :description "A user's Addresses.")
  (:id "Charges" :visiblity :private :permission-scope :billing_r
   :type (array-of "BillCharge") :description
   "A user's (buyer's) Charges.")
  (:id "Payments" :visiblity :private :permission-scope :billing_r
   :type (array-of "BillPayment") :description
   "A user's (buyer's) Payments."))
 :methods
 ((:method-name "findAllUsers" :synopsis
   "Finds all Users whose name or username match the keywords parameter."
   :http-method :get :method-uri "/users" :parameters
   ((:id "keywords" :required nil :default nil :type "string")
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)
  (:method-name "getUser" :synopsis "Retrieves a User by id."
   :http-method :get :method-uri "/users/:user_id" :parameters
   ((:id "user_id" :required t :default nil :type
     (array-of "user_id_or_name")))
   :oauth? nil :pscope nil)
  (:method-name "findAllUsersForTeam" :synopsis
   "Returns a list of users for a specific team" :http-method :get
   :method-uri "/teams/:team_id/users/" :parameters
   ((:id "team_id" :required t :default nil :type "int")
    (:id "status" :required nil :default "active" :type
     (enum "active" "invited" "pending"))
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)
  (:method-name "getCirclesContainingUser" :synopsis
   "Returns a list of users who have circled this user" :http-method
   :get :method-uri "/users/:user_id/circles" :parameters
   ((:id "user_id" :required t :default nil :type "user_id_or_name")
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)
  (:method-name "getConnectedUser" :synopsis
   "Returns details about a connection between users" :http-method
   :get :method-uri "/users/:user_id/circles/:to_user_id" :parameters
   ((:id "user_id" :required t :default nil :type "user_id_or_name")
    (:id "to_user_id" :required t :default nil :type
     "user_id_or_name")
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)))


:listing

(:name "Listing" :overview
 "Listings on Etsy are items for sale. Each Listing is associated with a User, and with a Shop (Users own Shops.) Etsy Listings have a creation date, and are valid for approximately four months. Listings have a price and a quantity, and when they're sold out, the User must renew them before they can be sold again.

Listing States[anchor]

The state field of Listings indicates whether a Listing is currently available for display on Etsy. Most of the time, you will only see Listings in the \"active\" state, but the following states may rarely appear:

   State     Can Edit Can Renew                                                                                                                                                                     Meaning
active       Yes      Yes       The Listing is currently for sale.
removed      No       No        The Listing has been removed by its owner.
sold_out     Yes*     Yes       The Listing has sold out. *Sold out listings can be edited, but active=true will only be honored if renew=true is aso passed. Users will be billed for this action. Otherwise, the listing will remain in the expired state. Note that when editing a sold out listing, you will need to update the quantity to a value greater than zero.
expired      Yes**    Yes       The Listing has expired. **Expired listings can be edited, but active=true will only be honored if renew=true is also passed. Users will be billed for this action. Otherwise, the listing will remain in the expired state.
alchemy      No       No        Deprecated; please ignore.
edit         No       No        The Listing is inactive. (For legacy reasons, this displays as \"edit\".)
draft        No       No        Draft listings are listings that have been saved prior to their first activation. The API can create draft listings, and also make draft listings active, but note that a listing in any other state cannot be moved to draft, nor can a draft listing be moved to any state other than active.
create       No       No        Deprecated. The Listing is currently being edited by the owner (as part of the initial Listing creation.)
private      No       No        The owner of the Listing has requested that it not appear in API results.
unavailable  No       No        The Listing has been removed by Etsy admin for unspecified reasons.

Searching Listings[anchor]

By default, the method findAllListingActive returns all active Listings on Etsy, paginated by date. Use the optional parameters (such as keyword, min_price, etc.) to narrow these results. The sort_order and sort_on parameters can be used to change the order of returned results. Note that these parameters are only available when using sort options. Without sort options, they will be ignored (and Listings will be returned newest-first.)

To search within a shop, use findAllShopListingsActive.

Editing Listings and Bill Charges[anchor]

Listings may be edited with the updateListing method. Note that the Etsy API will attempt to activate a Listing after every edit operation. This may result in charges to the user's Etsy bill. To edit an inactive Listing without activating it, pass the optional parameter state=inactive. Note that edit options that increase the quantity of a Listing will result in charges to the owner. It is the developer's responsibility to warn the user that such charges may occur.

To renew a Listing for another four months, pass the optional parameter renew=true. A Listing does not need to be expired to be renewed, however note that each renewal does not take the Listing's previous expiration date into account, so any unused time remaining on the Listing's old expiration date will be lost. Renewals will result in charges to a user's bill.

Translations[anchor]

Data of some models in the API can be expressed in multiple languages. For example, a Listing's title and description can be translated into German or French. To access this data in the API you can use the language parameter. Like this /listings/12345?language=de. For more information about this look at Working with Translations.

Categories and Tags[anchor]

Categories are no longer the first three tags of a Listing. Category is a first-class resource, with its own primary key ID. When calling createListing, you must pass a category_id to specify the category for the Listing.

Marketplace Attributes[anchor]

The fields who_made, when_made and is_supply are the so-called Marketplace Attributes that help buyers locate a Listing under the headings Handmade, Vintage and Supplies. When creating new Listings, these parameters are required. As of this writing, not all Listings on Etsy have their Marketplace Attributes set. These Listings will return null in these fields."
 :fields
 ((:id "listing_id" :visiblity :public :permission-scope nil :type
   "int" :description "The listing's numeric ID.")
  (:id "state" :visiblity :public :permission-scope nil :type
   "string" :description
   "One of active, removed, sold_out, expired, alchemy, edit, create, private, or unavailable.")
  (:id "user_id" :visiblity :public :permission-scope nil :type "int"
   :description "The numeric ID of the user who posted the item.")
  (:id "category_id" :visiblity :public :permission-scope nil :type
   "int" :description "The numeric ID of the listing's category.")
  (:id "title" :visiblity :public :permission-scope nil :type
   "string" :description "The listing's title.")
  (:id "description" :visiblity :public :permission-scope nil :type
   "string" :description "A description of the item.")
  (:id "creation_tsz" :visiblity :public :permission-scope nil :type
   "float" :description "Creation time, in epoch seconds.")
  (:id "ending_tsz" :visiblity :public :permission-scope nil :type
   "float" :description
   "The listing's expiration date and time, in epoch seconds.")
  (:id "original_creation_tsz" :visiblity :public :permission-scope
   nil :type "float" :description
   "The date and time the listing was originally posted, in epoch seconds.")
  (:id "last_modified_tsz" :visiblity :public :permission-scope nil
   :type "float" :description
   "The date and time the listing was updated, in epoch seconds.")
  (:id "price" :visiblity :public :permission-scope nil :type
   "string" :description
   "The item's price (will be treated as private for sold listings).")
  (:id "currency_code" :visiblity :public :permission-scope nil :type
   "string" :description
   "The ISO (alphabetic) code for the item's currency.")
  (:id "quantity" :visiblity :public :permission-scope nil :type
   "int" :description
   "The quantity of this item available for sale.")
  (:id "tags" :visiblity :public :permission-scope nil :type
   (array-of "string") :description "A list of tags for the item.")
  (:id "category_path" :visiblity :public :permission-scope nil :type
   (array-of "string") :description
   "Name of the category of the item and the names of categories in that hierarchy.")
  (:id "category_path_ids" :visiblity :public :permission-scope nil
   :type (array-of "int") :description
   "The numeric ID of each category in the this Listing's category hierarchy.")
  (:id "materials" :visiblity :public :permission-scope nil :type
   (array-of "string") :description
   "A list of materials used in the item.")
  (:id "shop_section_id" :visiblity :public :permission-scope nil
   :type "int" :description
   "The numeric ID of the shop section for this listing, can be null")
  (:id "featured_rank" :visiblity :public :permission-scope nil :type
   "int" :description
   "Search relevancy score (only when sorting a search on \"score\").")
  (:id "state_tsz" :visiblity :public :permission-scope nil :type
   "float" :description
   "The time at which the listing last changed state.")
  (:id "url" :visiblity :public :permission-scope nil :type "string"
   :description "The full URL to the listing's page on Etsy.")
  (:id "views" :visiblity :public :permission-scope nil :type "int"
   :description
   "The number of times the listing has been viewed on Etsy.com (does not include API views).")
  (:id "num_favorers" :visiblity :public :permission-scope nil :type
   "int" :description
   "The number of members who've marked this Listing as a favorite")
  (:id "shipping_template_id" :visiblity :public :permission-scope
   nil :type "int" :description
   "The numeric ID of the shipping template associated with the listing (write only).")
  (:id "shipping_profile_id" :visiblity :public :permission-scope nil
   :type "int" :description "Deprecated.")
  (:id "processing_min" :visiblity :public :permission-scope nil
   :type "int" :description
   "The minimum number of days for processing for this listing.")
  (:id "processing_max" :visiblity :public :permission-scope nil
   :type "int" :description
   "The maximum number of days for processing for this listing.")
  (:id "who_made" :visiblity :public :permission-scope nil :type
   (enum "i_did" "collective" "someone_else") :description
   "Who made the item being listed.")
  (:id "is_supply" :visiblity :public :permission-scope nil :type
   "boolean" :description "True if the listing is a supply.")
  (:id "when_made" :visiblity :public :permission-scope nil :type
   (enum "made_to_order" "2010_2013" "2000_2009" "1994_1999"
    "before_1994" "1990_1993" "1980s" "1970s" "1960s" "1950s" "1940s"
    "1930s" "1920s" "1910s" "1900s" "1800s" "1700s" "before_1700")
   :description "When was the item made.")
  (:id "recipient" :visiblity :public :permission-scope nil :type
   (enum "men" "women" "unisex_adults" "teen_boys" "teen_girls"
    "teens" "boys" "girls" "children" "baby_boys" "baby_girls"
    "babies" "birds" "cats" "dogs" "pets")
   :description "Who is this listing for.")
  (:id "occasion" :visiblity :public :permission-scope nil :type
   (enum "anniversary" "baptism" "bar_or_bat_mitzvah" "birthday"
    "canada_day" "chinese_new_year" "cinco_de_mayo" "confirmation"
    "christmas" "day_of_the_dead" "easter" "eid" "engagement"
    "fathers_day" "get_well" "graduation" "halloween" "hanukkah"
    "housewarming" "kwanza" "prom" "july_4th" "mothers_day"
    "new_baby" "new_years" "quinceanera" "retirement"
    "st_patricks_day" "sweet_16" "sympathy" "thanksgiving"
    "valentines" "wedding")
   :description "What is the occasion for this listing.")
  (:id "style" :visiblity :public :permission-scope nil :type
   (array-of "string") :description
   "Style of this listing. Each style is a free-form text string such as \"Formal\", or \"Steampunk\". A Listing may have up to two styles.")
  (:id "non_taxable" :visiblity :public :permission-scope nil :type
   "boolean" :description
   "If this flag is true, any applicable shop tax rates will not be applied to this listing on checkout.")
  (:id "has_variations" :visiblity :public :permission-scope nil
   :type "boolean" :description
   "True if variations are available for this Listing. (NOTE: This is a beta feature.)"))
 :associations
 ((:id "User" :visiblity :public :permission-scope nil :type "User"
   :description "The user who posted the listing.")
  (:id "Shop" :visiblity :public :permission-scope nil :type "Shop"
   :description "The shop to which the listing belongs.")
  (:id "Section" :visiblity :public :permission-scope nil :type
   "ShopSection" :description
   "The shop section to which the listing belongs.")
  (:id "Images" :visiblity :public :permission-scope nil :type
   (array-of "ListingImage") :description
   "An array of images for the listing.")
  (:id "MainImage" :visiblity :public :permission-scope nil :type
   "ListingImage" :description
   "The main image associated with this Listing")
  (:id "ShippingInfo" :visiblity :public :permission-scope nil :type
   (array-of "ShippingInfo") :description
   "An array of destinations and shipping prices for this listing.")
  (:id "PaymentInfo" :visiblity :public :permission-scope nil :type
   (array-of "PaymentTemplate") :description
   "An array of accepted payment methods for this listing.")
  (:id "Translations" :visiblity :public :permission-scope nil :type
   (array-of "ListingTranslation") :description
   "An array of translations for this Listing.")
  (:id "Variations" :visiblity :public :permission-scope nil :type
   (array-of "Variations_Property") :description
   "An array of variations for this Listing. (NOTE: This is a beta feature, and can only be used with the getListing and getTransaction methods.)"))
 :methods nil)


:shoptranslation

(:name "ShopTranslation" :overview
 "Represents the translation data for a Shop." :fields
 ((:id "shop_id" :visiblity :public :permission-scope nil :type "int"
   :description "The numeric ID for the Shop.")
  (:id "language" :visiblity :public :permission-scope nil :type
   "language" :description
   "The IETF language tag (e.g. 'fr') for the language of this translation.")
  (:id "announcement" :visiblity :public :permission-scope nil :type
   "string" :description
   "Translation of an announcement to buyers that displays on the shop's homepage.")
  (:id "policy_welcome" :visiblity :public :permission-scope nil
   :type "string" :description
   "Translation of the introductory text from the top of the seller's policies page (may be blank).")
  (:id "policy_payment" :visiblity :public :permission-scope nil
   :type "string" :description
   "Translation of the seller's policy on payment (may be blank).")
  (:id "policy_shipping" :visiblity :public :permission-scope nil
   :type "string" :description
   "Translation of the seller's policy on shipping (may be blank).")
  (:id "policy_refunds" :visiblity :public :permission-scope nil
   :type "string" :description
   "Translation of the seller's policy on refunds (may be blank).")
  (:id "policy_additional" :visiblity :public :permission-scope nil
   :type "string" :description
   "Translation of any additional policy information the seller provides (may be blank).")
  (:id "policy_seller_info" :visiblity :public :permission-scope nil
   :type "string" :description
   "Translation of the Shop's Seller information (may be blank).")
  (:id "sale_message" :visiblity :public :permission-scope nil :type
   "string" :description
   "Translation of a message that is sent to users who buy from this shop.")
  (:id "title" :visiblity :public :permission-scope nil :type
   "string" :description
   "Translation of a brief heading for the shop's main page.")
  (:id "vacation_autoreply" :visiblity :public :permission-scope nil
   :type "string" :description
   "Translation of a message to buyers in response to new convos (if Shop.is_vacation is true).")
  (:id "vacation_message" :visiblity :public :permission-scope nil
   :type "string" :description
   "Translation of a message to buyers (if Shop.is_vacation is true)."))
 :associations nil :methods
 ((:method-name "getShopTranslation" :synopsis
   "Retrieves a ShopTranslation by shop_id and language" :http-method
   :get :method-uri "/shops/:shop_id/translations/:language"
   :parameters
   ((:id "shop_id" :required t :default nil :type "shop_id_or_name")
    (:id "language" :required t :default nil :type "language"))
   :oauth? nil :pscope nil)))


:ledger

(:name "Ledger" :overview "Represents a shop's ledger." :fields
 ((:id "ledger_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The ledger's numeric ID.")
  (:id "shop_id" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "The shop's numeric ID.")
  (:id "currency" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "The currency code of the shop.")
  (:id "create_date" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The date and time the ledger was created in Epoch seconds.")
  (:id "update_date" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The date and time the ledger was last updated in Epoch seconds."))
 :associations nil :methods nil)


:segmentposter

(:name "SegmentPoster" :overview
 "A Marketplace Browse Segment Poster which represents a set of Marketplace Browse Segments - These represent the curated pages that sometimes appear inside of Browse Pages, full of both links to segments below the level of the current path, and images to represent each curated sub-segment. More information is in this Etsy News Blog post."
 :fields
 ((:id "name" :visiblity :public :permission-scope nil :type "string"
   :description "The formatted name for this SegmentPoster")
  (:id "path" :visiblity :public :permission-scope nil :type "string"
   :description
   "The sequence of slugified names leading to a Segment represented by this SegmentPoster")
  (:id "image_url" :visiblity :public :permission-scope nil :type
   "string" :description
   "A fullxfull image representing this SegmentPoster's content")
  (:id "shop_id" :visiblity :public :permission-scope nil :type "int"
   :description
   "(Optional) The id of the Shop from which the image_url was chosen")
  (:id "shop_name" :visiblity :public :permission-scope nil :type
   "int" :description
   "(Optional) The name of the Shop from which the image_url was chosen")
  (:id "weight" :visiblity :public :permission-scope nil :type "int"
   :description
   "A number starting at 1 representing how prominent this SegmentPoster is relative to other SegmentPosters"))
 :associations nil :methods
 ((:method-name "findBrowseSegmentPosters" :synopsis
   "Find Browse SegmentPosters by Segment slug" :http-method :get
   :method-uri "/segments/posters" :parameters
   ((:id "path" :required nil :default nil :type "string")) :oauth?
   nil :pscope nil)))


:transaction

(:name "Transaction" :overview
 "Represents the sale of a single item." :fields
 ((:id "transaction_id" :visiblity :public :permission-scope nil
   :type "int" :description "The numeric ID for this transaction.")
  (:id "title" :visiblity :public :permission-scope nil :type
   "string" :description
   "The title of the listing for this transaction.")
  (:id "description" :visiblity :public :permission-scope nil :type
   "string" :description
   "The description of the listing for this transaction.")
  (:id "seller_user_id" :visiblity :public :permission-scope nil
   :type "int" :description
   "The numeric ID for the seller of this transaction.")
  (:id "buyer_user_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The numeric ID for the buyer of this transaction.")
  (:id "creation_tsz" :visiblity :public :permission-scope nil :type
   "float" :description
   "The date and time the transaction was created, in epoch seconds.")
  (:id "paid_tsz" :visiblity :private :permission-scope
   :transactions_r :type "float" :description
   "The date and time the transaction was paid, in epoch seconds.")
  (:id "shipped_tsz" :visiblity :private :permission-scope
   :transactions_r :type "float" :description
   "The date and time the transaction was shipped, in epoch seconds.")
  (:id "price" :visiblity :private :permission-scope :transactions_r
   :type "float" :description "The price of the transaction.")
  (:id "currency_code" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "The ISO code (alphabetic) for the seller's native currency.")
  (:id "quantity" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The quantity of items in this transaction.")
  (:id "tags" :visiblity :public :permission-scope nil :type
   (array-of "string") :description
   "The tags in the listing for this transaction.")
  (:id "materials" :visiblity :public :permission-scope nil :type
   (array-of "string") :description
   "The materials in the listing for this transaction.")
  (:id "image_listing_id" :visiblity :public :permission-scope nil
   :type "int" :description
   "The numeric ID of the primary listing image for this transaction.")
  (:id "receipt_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The numeric ID for the receipt associated to this transaction.")
  (:id "shipping_cost" :visiblity :private :permission-scope
   :transactions_r :type "float" :description
   "The shipping cost for this transaction.")
  (:id "listing_id" :visiblity :public :permission-scope nil :type
   "int" :description
   "The numeric ID for this listing associated to this transaction.")
  (:id "seller_feedback_id" :visiblity :public :permission-scope nil
   :type "int" :description "The numeric ID of seller's feedback.")
  (:id "buyer_feedback_id" :visiblity :public :permission-scope nil
   :type "int" :description
   "The numeric ID for the buyer's feedback.")
  (:id "transaction_type" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "The type of transaction, usually \"listing\".")
  (:id "url" :visiblity :public :permission-scope nil :type "string"
   :description "URL of this transaction")
  (:id "variations" :visiblity :public :permission-scope nil :type
   (array-of "Variations_SelectedProperty") :description
   "Purchased variations for this transaction. (NOTE: this is a beta feature.)"))
 :associations
 ((:id "Buyer" :visiblity :private :permission-scope :transactions_r
   :type "User" :description
   "The buyer that is associated with this transaction.")
  (:id "MainImage" :visiblity :public :permission-scope nil :type
   "ListingImage" :description
   "The primary listing image for this transaction.")
  (:id "Listing" :visiblity :public :permission-scope nil :type
   "Listing" :description
   "The listing that is associated with this transaction.")
  (:id "Seller" :visiblity :public :permission-scope nil :type "User"
   :description
   "The seller that is associated with this transaction.")
  (:id "Receipt" :visiblity :private :permission-scope
   :transactions_r :type "Receipt" :description
   "The receipt that is associated with this transaction."))
 :methods nil)


:tag

(:name "Tag" :overview "A user-supplied term attached to a listing."
 :fields
 ((:id "tag" :visiblity :public :permission-scope nil :type "string"
   :description "The tag's short name.")
  (:id "name" :visiblity :public :permission-scope nil :type "string"
   :description "The tag's display name.")
  (:id "num_listings" :visiblity :public :permission-scope nil :type
   "int" :description "The number of listings tagged with this tag.")
  (:id "weight" :visiblity :public :permission-scope nil :type "int"
   :description
   "Relative weight (0-100) of this tag compared to other tags in the current result set."))
 :associations nil :methods
 ((:method-name "findPopularTags" :synopsis
   "DEPRECATED - Retrieves all related tags for the given tag set."
   :http-method :get :method-uri "/taxonomy/tags" :parameters
   ((:id "limit" :required nil :default "25" :type "int")) :oauth?
   nil :pscope nil)
  (:method-name "findAllRelatedTags" :synopsis
   "DEPRECATED - Retrieves all related tags for the given tag set."
   :http-method :get :method-uri "/taxonomy/tags/:tags" :parameters
   ((:id "tags" :required t :default nil :type (array-of "string"))
    (:id "limit" :required nil :default "25" :type "int"))
   :oauth? nil :pscope nil)))


:billcharge

(:name "BillCharge" :overview
 "Represents a charge to an Etsy member's account.

BillCharge Types[anchor]

The type field of BillCharge indicates what the charge is:

         Type             Associated type_id                                  Meaning
listing                listing_id                Seller fee for listing an item.
edit                   listing_id                Seller fee if listing quantity increased.
renew                  listing_id                Seller fee for renewing active listing.
renew_sold             listing_id                Seller fee for renewing sold listing.
renew_sold_auto        listing_id                Seller fee for (automatically) renewing listing after a sale.
transaction_quantity   transaction_id            Seller fee for a sale of listing with multiple quantity.
renew_expired          listing_id                Seller fee for renewing expired listing.
transaction            transaction_id            Seller fee for sold item.
shipping_labels        shipping_label_id         Seller fee for postage and insurance cost.
search_ads             campaign_instance_id      Seller fee for purchased search ads.
showcase_category      showcase_reservation_id   Seller fee for current Showcase feature.
showcase               showcase_reservation_id   (DEPRECATED) Seller fee for original Showcase feature.
alchemy                listing_id                (DEPRECATED) Seller fee for Alchemy feature.

getUserChargesMetadata[anchor]

   Method Name     getUserChargesMetadata
     Synopsis      Metadata for the set of BillCharges objects associated to a User
   HTTP Method     GET
       URI         /users/:user_id/charges/meta
                       Name         Required        Default               Type
    Parameters     user_id       Y                             user_id_or_name

  Requires OAuth   Y
 Permission Scope  billing_r"
 :fields
 ((:id "bill_charge_id" :visiblity :private :permission-scope
   :billing_r :type "int" :description
   "The numeric ID for this bill charge record.")
  (:id "creation_tsz" :visiblity :private :permission-scope
   :billing_r :type "float" :description
   "Creation time, in epoch seconds.")
  (:id "type" :visiblity :private :permission-scope :billing_r :type
   "string" :description "The name of the type of charge.")
  (:id "type_id" :visiblity :private :permission-scope :billing_r
   :type "int" :description
   "The Listing or Transaction ID to which the charge applies.")
  (:id "user_id" :visiblity :private :permission-scope :billing_r
   :type "int" :description "The user's numeric ID.")
  (:id "amount" :visiblity :private :permission-scope :billing_r
   :type "float" :description "The amount charged.")
  (:id "currency_code" :visiblity :private :permission-scope
   :billing_r :type "string" :description
   "The currency of the charge.")
  (:id "creation_year" :visiblity :private :permission-scope
   :billing_r :type "int" :description
   "Year that the charge was created.")
  (:id "creation_month" :visiblity :private :permission-scope
   :billing_r :type "int" :description
   "Month that the charge was created.")
  (:id "last_modified_tsz" :visiblity :private :permission-scope
   :billing_r :type "float" :description
   "Time when charge was last modified."))
 :associations nil :methods nil)


:shopabout

(:name "ShopAbout" :overview "Data about a user's shop." :fields
 ((:id "shop_id" :visiblity :public :permission-scope nil :type "int"
   :description "Numeric ID of the shop section.")
  (:id "status" :visiblity :public :permission-scope nil :type
   "string" :description
   "Status of this data: active or draft. Only Shop owners can see drafts.")
  (:id "story_headline" :visiblity :public :permission-scope nil
   :type "string" :description "ShopAbout headline text")
  (:id "story_leading_paragraph" :visiblity :public :permission-scope
   nil :type "string" :description
   "The first part of the ShopAbout story")
  (:id "story" :visiblity :public :permission-scope nil :type
   "string" :description "The full ShopAbout story text")
  (:id "related_links" :visiblity :public :permission-scope nil :type
   (array-of "string") :description "The ShopAbout related links"))
 :associations
 ((:id "Shop" :visiblity :public :permission-scope nil :type "Shop"
   :description "The shop this detail data belongs to")
  (:id "Members" :visiblity :public :permission-scope nil :type
   (array-of "ShopAboutMember") :description
   "The ShopAboutMembers of this Shop")
  (:id "Images" :visiblity :public :permission-scope nil :type
   (array-of "ShopAboutImages") :description
   "An array of images to be included with ShopAbout details"))
 :methods
 ((:method-name "getShopAbout" :synopsis
   "Retrieves a ShopAbout object associated to a Shop." :http-method
   :get :method-uri "/shops/:shop_id/about" :parameters
   ((:id "shop_id" :required t :default nil :type "shop_id_or_name"))
   :oauth? nil :pscope nil)))


:variations_property

(:name "Variations_Property" :overview
 "Represents a property from a list of default or seller-defined properties to describe a variation of a listing. In addition to a default list including Size, Color, Finish, Dimensions and others, sellers may specify custom properties to more aptly describe their listings. When available, properties are returned as part of a Listing as the Variations association.

Although a Listing can be assigned any two properties from the list of available Variations properties, some properties and values are suggested for Listings in particular categories. The Variations_PropertySet resource can be used to access suggestions for a category.

Sellers are given their choice of two custom properties, which can be used for any purpose. When adding custom Variations, be sure to specify a map of property IDs and names using the custom_property_names field. NOTE: Using custom properties in place of predefined properties (Size, Color, Width, etc.) may be harmful to a Listing's search relevancy at a later date. Custom properties should only be used when no other property is suitable.

Optional qualifying properties should be specified when appropriate, and may be used in search at a later date. To determine the appropriate qualifiers and their values, see the Variations_PropertySet resource. (NOTE: If the recipient_id qualifier is specified here, it will overwrite the value of recipient on the Listing. When in doubt, the value appropriate to added Variations should be preferred.)

NOTE: Support for Listing Variations is a beta feature. For full documentation on working with Listing Variations, see Working with Variations."
 :fields
 ((:id "property_id" :visiblity :public :permission-scope nil :type
   "int" :description "This numeric ID of this property")
  (:id "formatted_name" :visiblity :public :permission-scope nil
   :type "string" :description
   "This translated name of this property")
  (:id "options" :visiblity :public :permission-scope nil :type
   (array-of "Variations_Option") :description
   "Available options for this property"))
 :associations nil :methods nil)


:shippingtemplateentry

(:name "ShippingTemplateEntry" :overview
 "Represents one entry in a shipping template.

ShippingTemplate, ShippingTemplateEntry, and ShippingInfo[anchor]

The diagram below is an ERD of the relevant portion of the database related to Listings.  Each Listing has a User,  and each User can have 0 or more ShippingTemplates.  We are enforcing that a user create at least one ShippingTemplate before creating a listing.   When that Listing is created the ShippingTemplate gets copied into the ShippingInfo table and is associated to that Listing.  You can then edit the ShippingInfo directly for a listing,  or update your ShippingTemplate and update the Listing with it.

[seller_too]

  • A ShippingTemplate has a title and is owned by a user.
  • ShippingInfo is a set of records that define shipping information for a specific listing.  They are created from a ShippingTemplate.
  • ShippingTemplateEntries are a set of rows that correspond to this template.
      □ They hold an origin country,  and a destination, as well as the primary and secondary cost.
      □ There is only one origin per template,  so this is changed on the ShippingTemplate resource instead of the ShippingTemplateEntry. 
  • You can pass a destination id or a region id when creating a ShippingTemplateEntry, but not both - If you leave them both blank then the destination is assumed to be \"everywhere\"
  • If you create a  ShippingTemplateEntry with a region,  this implies several destinations and will insert a row for each destination within that region.
  • If you delete a ShippingTemplateEntry that is a region,  it will delete all corresponding destinations for that region.
  • You can update a ShippingTemplateEntry,  but because a region defines many rows, and different regions may have a different number of rows,  you cannot update the region.   You must first delete an entry corresponding to that region,  and then add an entry with the new region."
 :fields
 ((:id "shipping_template_entry_id" :visiblity :private
   :permission-scope :listings_r :type "int" :description
   "The numeric ID of this shipping template entry.")
  (:id "shipping_template_id" :visiblity :private :permission-scope
   :listings_r :type "int" :description
   "The numeric ID of the template this entry belongs to.")
  (:id "currency_code" :visiblity :private :permission-scope
   :listings_r :type "string" :description
   "The currency code for the prices in this template entry.")
  (:id "origin_country_id" :visiblity :private :permission-scope
   :listings_r :type "int" :description
   "The numeric ID of the country from which the listing ships.")
  (:id "destination_country_id" :visiblity :private :permission-scope
   :listings_r :type "int" :description
   "The numeric ID of the country to which the listing ships (optional). If missing, these fees apply to all destinations.")
  (:id "destination_region_id" :visiblity :private :permission-scope
   :listings_r :type "int" :description
   "The numeric ID of the region to which the listing ships (optional). Regions are collections of countries.")
  (:id "primary_cost" :visiblity :private :permission-scope
   :listings_r :type "float" :description
   "The shipping fee for this item, if shipped alone.")
  (:id "secondary_cost" :visiblity :private :permission-scope
   :listings_r :type "float" :description
   "The shipping fee for this item, if shipped with another item."))
 :associations
 ((:id "OriginCountry" :visiblity :private :permission-scope
   :listings_r :type "Country" :description
   "The full Country record for the shipping origin.")
  (:id "DestinationCountry" :visiblity :private :permission-scope
   :listings_r :type "Country" :description
   "The full Country record for the shipping destination.")
  (:id "DestinationRegion" :visiblity :private :permission-scope
   :listings_r :type "Region" :description
   "The full Region record for the shipping destination region.")
  (:id "Template" :visiblity :private :permission-scope :listings_r
   :type "ShippingTemplate" :description
   "The template to which this entry belongs."))
 :methods
 ((:method-name "findAllShippingTemplateEntries" :synopsis
   "Retrieves a set of ShippingTemplateEntry objects associated to a ShippingTemplate."
   :http-method :get :method-uri
   "/shipping/templates/:shipping_template_id/entries" :parameters
   ((:id "shipping_template_id" :required t :default nil :type "int")
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)))


:userprofile

(:name "UserProfile" :overview
 "Represents a user's public profile. Generally, this is the information available for a member as \"Public Profile\" on Etsy.com

Deprecated"
 :fields
 ((:id "user_profile_id" :visiblity :public :permission-scope nil
   :type "int" :description
   "The numeric ID of the user profile.                          DEPRECATED: Do not use")
  (:id "user_id" :visiblity :public :permission-scope nil :type "int"
   :description
   "The numeric ID of the user this profile corresponds to.")
  (:id "login_name" :visiblity :public :permission-scope nil :type
   "string" :description
   "The login name of the user that owns this profile.")
  (:id "bio" :visiblity :public :permission-scope nil :type "string"
   :description "The bio of the user.")
  (:id "gender" :visiblity :public :permission-scope nil :type
   "string" :description "The gender of the user.")
  (:id "birth_month" :visiblity :public :permission-scope nil :type
   "string" :description "The birth month of the user.")
  (:id "birth_day" :visiblity :public :permission-scope nil :type
   "string" :description "The birth day of the user.")
  (:id "birth_year" :visiblity :private :permission-scope :profile_r
   :type "string" :description "The birth year of the user.")
  (:id "join_tsz" :visiblity :public :permission-scope nil :type
   "float" :description
   "The date and time the user was created, in epoch seconds.")
  (:id "materials" :visiblity :public :permission-scope nil :type
   "string" :description "A list of the user's favorite materials.")
  (:id "country_id" :visiblity :public :permission-scope nil :type
   "int" :description "The numeric ID of the user's country.")
  (:id "region" :visiblity :public :permission-scope nil :type
   "string" :description "The user's region (free-form text)")
  (:id "city" :visiblity :public :permission-scope nil :type "string"
   :description "The user's city (free-form text)")
  (:id "location" :visiblity :public :permission-scope nil :type
   "string" :description
   "[DEPRECATED] The user's location (self-supplied, free-form text).")
  (:id "avatar_id" :visiblity :public :permission-scope nil :type
   "int" :description "The numeric ID of this user's avatar image.")
  (:id "lat" :visiblity :private :permission-scope :profile_r :type
   "float" :description "The latitude of the user.")
  (:id "lon" :visiblity :private :permission-scope :profile_r :type
   "float" :description "The longitude of the user.")
  (:id "transaction_buy_count" :visiblity :public :permission-scope
   nil :type "int" :description
   "The number of bought items for this user.")
  (:id "transaction_sold_count" :visiblity :public :permission-scope
   nil :type "int" :description
   "The number of sold transactions for this user.")
  (:id "is_seller" :visiblity :public :permission-scope nil :type
   "boolean" :description
   "If the user is a seller or not. Value true if user is a seller.")
  (:id "image_url_75x75" :visiblity :public :permission-scope nil
   :type "string" :description
   "The URL to the user's avatar image; dimensions 75px square.")
  (:id "first_name" :visiblity :public :permission-scope nil :type
   "string" :description "The first name of the user.")
  (:id "last_name" :visiblity :public :permission-scope nil :type
   "string" :description "The last name of the user."))
 :associations
 ((:id "Country" :visiblity :public :permission-scope nil :type
   "Country" :description "The country in which the user lives."))
 :methods
 ((:method-name "findUserProfile" :synopsis
   "Returns the UserProfile object associated with a User."
   :http-method :get :method-uri "/users/:user_id/profile"
   :parameters
   ((:id "user_id" :required t :default nil :type "user_id_or_name"))
   :oauth? nil :pscope nil)))


:order

(:name "Order" :overview
 "represents a collection of listings purchased by a user on a specific date and time."
 :fields
 ((:id "order_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The order's numeric ID.")
  (:id "user_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The numeric ID of the user who placed this order.")
  (:id "creation_tsz" :visiblity :private :permission-scope
   :transactions_r :type "float" :description
   "Creation time, in epoch seconds."))
 :associations
 ((:id "User" :visiblity :private :permission-scope :transactions_r
   :type "User" :description "The user who placed this order.")
  (:id "Receipts" :visiblity :private :permission-scope
   :transactions_r :type (array-of "Receipt") :description
   "An array of receipts associated to this order."))
 :methods nil)


:useraddress

(:name "UserAddress" :overview "Represents a user's address." :fields
 ((:id "user_address_id" :visiblity :private :permission-scope
   :address_r :type "int" :description
   "The numeric ID of the user's address.")
  (:id "user_id" :visiblity :private :permission-scope :address_r
   :type "int" :description "The user's numeric ID.")
  (:id "name" :visiblity :private :permission-scope :address_r :type
   "text" :description "The user's name for this address.")
  (:id "first_line" :visiblity :private :permission-scope :address_r
   :type "text" :description "The first line of the user's address.")
  (:id "second_line" :visiblity :private :permission-scope :address_r
   :type "text" :description
   "The second line of the user's address.")
  (:id "city" :visiblity :private :permission-scope :address_r :type
   "text" :description "The city field of the user's address.")
  (:id "state" :visiblity :private :permission-scope :address_r :type
   "text" :description "The state field of the user's address.")
  (:id "zip" :visiblity :private :permission-scope :address_r :type
   "text" :description "The zip code field of the user's address.")
  (:id "country_id" :visiblity :private :permission-scope :address_r
   :type "int" :description "The country's numeric ID.")
  (:id "country_name" :visiblity :private :permission-scope
   :address_r :type "string" :description
   "The name of the user's country"))
 :associations
 ((:id "Country" :visiblity :private :permission-scope :address_r
   :type "Country" :description
   "The full Country record for the user's address.")
  (:id "User" :visiblity :private :permission-scope :address_r :type
   "User" :description
   "The full User record whom entered this address."))
 :methods nil)


:billpayment

(:name "BillPayment" :overview "Represents a user's Billing Payment."
 :fields
 ((:id "bill_payment_id" :visiblity :private :permission-scope
   :billing_r :type "int" :description
   "The numeric ID for this bill payment record.")
  (:id "creation_tsz" :visiblity :private :permission-scope
   :billing_r :type "float" :description
   "Creation time, in epoch seconds.")
  (:id "type" :visiblity :private :permission-scope :billing_r :type
   "string" :description "The name of the type of payment.")
  (:id "type_id" :visiblity :private :permission-scope :billing_r
   :type "int" :description
   "The Listing or Transaction ID to which the payment applies.")
  (:id "user_id" :visiblity :private :permission-scope :billing_r
   :type "int" :description "The user's numeric ID.")
  (:id "amount" :visiblity :private :permission-scope :billing_r
   :type "float" :description "The amount paid.")
  (:id "currency_code" :visiblity :private :permission-scope
   :billing_r :type "string" :description
   "The currency of the payment.")
  (:id "creation_month" :visiblity :private :permission-scope
   :billing_r :type "int" :description
   "Month that the payment was made.")
  (:id "creation_year" :visiblity :private :permission-scope
   :billing_r :type "int" :description
   "Year that the payment was made."))
 :associations nil :methods nil)


:region

(:name "Region" :overview
 "Represents a collection of countries to which an item ships."
 :fields
 ((:id "region_id" :visiblity :public :permission-scope nil :type
   "int" :description "The numeric ID of this region.")
  (:id "region_name" :visiblity :public :permission-scope nil :type
   "string" :description "The name of the region."))
 :associations nil :methods
 ((:method-name "findAllRegion" :synopsis "Finds all Region."
   :http-method :get :method-uri "/regions" :parameters nil :oauth?
   nil :pscope nil)
  (:method-name "getRegion" :synopsis "Retrieves a Region by id."
   :http-method :get :method-uri "/regions/:region_id" :parameters
   ((:id "region_id" :required t :default nil :type
     (array-of "int")))
   :oauth? nil :pscope nil)))


:favoritelisting

(:name "FavoriteListing" :overview
 "Represents the association between a user and a listing they've marked as favorite."
 :fields
 ((:id "listing_id" :visiblity :public :permission-scope nil :type
   "int" :description "The listings numeric ID.")
  (:id "user_id" :visiblity :public/private :permission-scope
   :favorites_rw :type "int" :description
   "The user's numeric ID. Note: This field may be absent, depending on the user's privacy settings.")
  (:id "listing_state" :visiblity :public :permission-scope nil :type
   "string" :description "The state of the listing.")
  (:id "create_date" :visiblity :public :permission-scope nil :type
   "int" :description
   "The date and time that the listing was favorited.")
  (:id "state" :visiblity :public :permission-scope nil :type
   "string" :description
   "(DEPRECATED - use 'listing_state') The state of the listing.")
  (:id "creation_tsz" :visiblity :public :permission-scope nil :type
   "float" :description
   "(DEPRECATED - use 'create_date') The date and time that the listing was favorited.")
  (:id "favorite_listing_id" :visiblity :public :permission-scope nil
   :type "int" :description
   "(DEPRECATED - do not use) The numeric ID of this favorite listing association."))
 :associations
 ((:id "User" :visiblity :public/private :permission-scope
   :favorites_rw :type "User" :description
   "The user who favorited the listing. Note: This field may be absent, depending on the user's privacy settings.")
  (:id "Listing" :visiblity :public :permission-scope nil :type
   "Listing" :description "The favorited listing."))
 :methods
 ((:method-name "findAllListingFavoredBy" :synopsis
   "Retrieves a set of FavoriteListing objects associated to a Listing."
   :http-method :get :method-uri "/listings/:listing_id/favored-by"
   :parameters
   ((:id "listing_id" :required t :default nil :type "int")
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)
  (:method-name "findAllUserFavoriteListings" :synopsis
   "Finds all favorite listings for a user" :http-method :get
   :method-uri "/users/:user_id/favorites/listings" :parameters
   ((:id "user_id" :required t :default nil :type "user_id_or_name")
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)
  (:method-name "findUserFavoriteListings" :synopsis
   "Finds a favorite listing for a user" :http-method :get
   :method-uri "/users/:user_id/favorites/listings/:listing_id"
   :parameters
   ((:id "user_id" :required t :default nil :type "user_id_or_name")
    (:id "listing_id" :required t :default nil :type "int"))
   :oauth? nil :pscope nil)))


:shippinginfo

(:name "ShippingInfo" :overview
 "Shipping fees for a listing and a specific destination.

ShippingTemplate, ShippingTemplateEntry, and ShippingInfo[anchor]

The diagram below is an ERD of the relevant portion of the database related to Listings.  Each Listing has a User,  and each User can have 0 or more ShippingTemplates.  We are enforcing that a user create at least one ShippingTemplate before creating a listing.   When that Listing is created the ShippingTemplate gets copied into the ShippingInfo table and is associated to that Listing.  You can then edit the ShippingInfo directly for a listing,  or update your ShippingTemplate and update the Listing with it.

[seller_too]

  • A ShippingTemplate has a title and is owned by a user.
  • ShippingInfo is a set of records that define shipping information for a specific listing.  They are created from a ShippingTemplate.
  • ShippingTemplateEntries are a set of rows that correspond to this template.
      □ They hold an origin country,  and a destination, as well as the primary and secondary cost.
      □ There is only one origin per template,  so this is changed on the ShippingTemplate resource instead of the ShippingTemplateEntry. 
  • You can pass a destination id or a region id when creating a ShippingTemplateEntry, but not both - If you leave them both blank then the destination is assumed to be \"everywhere\"
  • If you create a  ShippingTemplateEntry with a region,  this implies several destinations and will insert a row for each destination within that region.
  • If you delete a ShippingTemplateEntry that is a region,  it will delete all corresponding destinations for that region.
  • You can update a ShippingTemplateEntry,  but because a region defines many rows, and different regions may have a different number of rows,  you cannot update the region.   You must first delete an entry corresponding to that region,  and then add an entry with the new region."
 :fields
 ((:id "shipping_info_id" :visiblity :public :permission-scope nil
   :type "int" :description
   "The numeric ID of this shipping info record.")
  (:id "origin_country_id" :visiblity :public :permission-scope nil
   :type "int" :description
   "The numeric ID of the country from which the listing ships.")
  (:id "destination_country_id" :visiblity :public :permission-scope
   nil :type "int" :description
   "The numeric ID of the country to which the listing ships (optional). If missing, these fees apply to all destinations.")
  (:id "currency_code" :visiblity :public :permission-scope nil :type
   "string" :description
   "Identifies the currency unit for shipping fees (currently, always 'USD').")
  (:id "primary_cost" :visiblity :public :permission-scope nil :type
   "float" :description
   "The shipping fee for this item, if shipped alone.")
  (:id "secondary_cost" :visiblity :public :permission-scope nil
   :type "float" :description
   "The shipping fee for this item, if shipped with another item.")
  (:id "listing_id" :visiblity :public :permission-scope nil :type
   "int" :description
   "The numeric ID of the listing to which this shipping info applies.")
  (:id "region_id" :visiblity :public :permission-scope nil :type
   "int" :description
   "The numeric ID of the region to which this shipping info applies (optional). If missing, no region is selected. Regions are shorthand for lists of individual countries.")
  (:id "origin_country_name" :visiblity :public :permission-scope nil
   :type "string" :description
   "The name of the country from which this item ships.")
  (:id "destination_country_name" :visiblity :public
   :permission-scope nil :type "string" :description
   "The name of the country to which this item ships."))
 :associations
 ((:id "DestinationCountry" :visiblity :public :permission-scope nil
   :type "Country" :description
   "The full Country record for the shipping destination.")
  (:id "OriginCountry" :visiblity :public :permission-scope nil :type
   "Country" :description
   "The full Country record for the shipping origin.")
  (:id "Region" :visiblity :public :permission-scope nil :type
   "Region" :description
   "The full Region record for the shipping destination region."))
 :methods
 ((:method-name "findAllListingShippingInfoAssoc" :synopsis
   "Retrieves a set of ShippingInfo objects associated to a Listing."
   :http-method :get :method-uri
   "/listings/:listing_id/shipping/info" :parameters
   ((:id "listing_id" :required t :default nil :type "int")
    (:id "limit" :required nil :default "25" :type "int")
    (:id "offset" :required nil :default "0" :type "int")
    (:id "page" :required nil :default nil :type "int"))
   :oauth? nil :pscope nil)))


:receipt

(:name "Receipt" :overview
 "Represents proof of payment from a user to a shop for one or more transactions."
 :fields
 ((:id "receipt_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The receipt's numeric ID.")
  (:id "order_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The numeric ID of the order this receipt is associated with.")
  (:id "seller_user_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The numeric ID of the seller for this receipt.")
  (:id "buyer_user_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The numeric ID of the buyer for this receipt.")
  (:id "creation_tsz" :visiblity :private :permission-scope
   :transactions_r :type "float" :description
   "Creation time, in epoch seconds.")
  (:id "last_modified_tsz" :visiblity :private :permission-scope
   :transactions_r :type "float" :description
   "Last modification time, in epoch seconds.")
  (:id "name" :visiblity :private :permission-scope :transactions_r
   :type "string" :description
   "The name portion of the buyer's address.")
  (:id "first_line" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "The first line of the buyer's address.")
  (:id "second_line" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "The second line of the buyer's address.")
  (:id "city" :visiblity :private :permission-scope :transactions_r
   :type "string" :description "The city for the buyer's address.")
  (:id "state" :visiblity :private :permission-scope :transactions_r
   :type "string" :description "The state for the buyer's address.")
  (:id "zip" :visiblity :private :permission-scope :transactions_r
   :type "string" :description
   "The zip code of the buyer's address.")
  (:id "country_id" :visiblity :private :permission-scope
   :transactions_r :type "int" :description
   "The numeric ID of the buyer's country.")
  (:id "payment_method" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "The payment method used. May be pp, cc, ck, mo, or other (stands for paypal, credit card, check, money order, other).")
  (:id "payment_email" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "The email address where payment confirmation is sent.")
  (:id "message_from_seller" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "An optional message from the seller.")
  (:id "message_from_buyer" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "An optional message from the buyer.")
  (:id "was_paid" :visiblity :private :permission-scope
   :transactions_r :type "boolean" :description
   "True if the receipt was paid.")
  (:id "total_tax_cost" :visiblity :private :permission-scope
   :transactions_r :type "float" :description
   "The total sales tax of the receipt.")
  (:id "total_price" :visiblity :private :permission-scope
   :transactions_r :type "float" :description
   "Sum of the individual listings' (price * quantity). Does not included tax or shipping costs.")
  (:id "total_shipping_cost" :visiblity :private :permission-scope
   :transactions_r :type "float" :description
   "The total shipping cost of the receipt.")
  (:id "currency_code" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "The ISO code (alphabetic) for the seller's native currency.")
  (:id "message_from_payment" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "The machine generated acknowledgement from the payment system.")
  (:id "was_shipped" :visiblity :private :permission-scope
   :transactions_r :type "boolean" :description
   "True if the items in the receipt were shipped.")
  (:id "buyer_email" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "The email address of the buyer.")
  (:id "seller_email" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "The email address of the seller.")
  (:id "discount_amt" :visiblity :private :permission-scope
   :transactions_r :type "float" :description
   "The total discount for the receipt, if using a discount (percent or fixed) Coupon. Free shipping Coupons are not reflected here; check the Coupon object for these.")
  (:id "subtotal" :visiblity :private :permission-scope
   :transactions_r :type "float" :description
   "total_price minus coupon discounts. Does not included tax or shipping costs.")
  (:id "grandtotal" :visiblity :private :permission-scope
   :transactions_r :type "float" :description
   "total_price minus coupon discount plus tax and shipping costs.")
  (:id "shipping_tracking_code" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "The tracking code for the shipment.")
  (:id "shipping_tracking_url" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "The tracking URL for the shipment.")
  (:id "shipping_carrier" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "The shipping carrier.")
  (:id "shipping_note" :visiblity :private :permission-scope
   :transactions_r :type "string" :description
   "The shipping notification note text."))
 :associations
 ((:id "Coupon" :visiblity :private :permission-scope :transactions_r
   :type "Coupon" :description "The coupon for the receipt.")
  (:id "Country" :visiblity :private :permission-scope
   :transactions_r :type "Country" :description
   "The country to which the order was shipped.")
  (:id "Buyer" :visiblity :private :permission-scope :transactions_r
   :type "User" :description
   "The buyer of the items in this receipt.")
  (:id "Order" :visiblity :private :permission-scope :transactions_r
   :type "Order" :description
   "The order this receipt is part of. (Only visible to the buyer.)")
  (:id "Seller" :visiblity :private :permission-scope :transactions_r
   :type "User" :description
   "The seller of the items in this receipt.")
  (:id "Transactions" :visiblity :private :permission-scope
   :transactions_r :type (array-of "Transaction") :description
   "The transactions associated to this receipt.")
  (:id "Listings" :visiblity :private :permission-scope
   :transactions_r :type (array-of "Listing") :description
   "The listings associated to this receipt."))
 :methods nil)

) ;; <<-- end the giant plist
