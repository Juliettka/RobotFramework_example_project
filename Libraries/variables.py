browser = "headless"
url = "https://www.saucedemo.com/"
username_input = "id:user-name"
password_input = "id:password"
login_button = "id:login-button"
login_error = "//*[@id=\"login_button_container\"]/div/form/div[3]/h3"
standard_username = "standard_user"
locked_username = "locked_out_user"
password = "secret_sauce"
menu = "class:bm-burger-button"
logout = "id:logout_sidebar_link"
filter_dropdown = "class:product_sort_container"
home_page_text_elements = [
    "Swag Labs",
    "Products",
    "Sauce Labs Backpack",
    "Sauce Labs Bike Light",
    "Sauce Labs"
]
image = "/static/media/sauce-backpack-1200x1500.0a0b85a3.jpg"
add_to_cart_button = "id:add-to-cart-sauce-labs-backpack"
remove_from_cart_button = "id:remove-sauce-labs-backpack"
shopping_cart = "id:shopping_cart_container"
shopping_cart_badge = "class:shopping_cart_badge"
checkout_button = "id:checkout"
firstname_input = "id:first-name"
lastname_input = "id:last-name"
postalcode_input = "id:postal-code"
continue_button = "id:continue"
price = "xpath://*[@id=\"checkout_summary_container\"]/div/div[2]/div[6]"
tax = "xpath://*[@id=\"checkout_summary_container\"]/div/div[2]/div[7]"
total_price = "xpath://*[@id=\"checkout_summary_container\"]/div/div[2]/div[8]"
finish_button = "id:finish"
back_home_button = "id:back-to-products"
inventory_list = "class:inventory_item_name"
inventory_price="class:inventory_item_price"