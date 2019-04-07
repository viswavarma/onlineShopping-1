<%@ page import="java.util.TreeMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<%@ page import="dao.ProductsDAO" %>
<%@ page import="bean.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Cart</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="vendors/linericon/style.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <!--================ Start Header Menu Area =================-->
	<%@include file="header.jsp"%>
	<!--================ End Header Menu Area =================-->

	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Shopping Cart</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Shopping Cart</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  

  <!--================Cart Area =================-->
                      <%
                          TreeMap<String, Integer> carts = (TreeMap<String, Integer>) request.getSession().getAttribute("cart");
                          double totalPrice = 0;
                          if (carts != null) {
                      %>
                      <section class="cart_area">
                          <div class="container">
                              <div class="cart_inner">
                                  <div class="table-responsive">
                                      <table class="table">
                                          <thead>
                                          <tr>
                                              <th scope="col">Product</th>
                                              <th scope="col">Price</th>
                                              <th scope="col">Quantity</th>
                                              <th scope="col">Total</th>
                                          </tr>
                                          </thead>
                                          <tbody>
                      <%
                              for (Map.Entry<String,Integer> entry : carts.entrySet()) {
                                  String prod_id = entry.getKey();
                                  Integer qty = entry.getValue();
                                  ProductsDAO productsDAO = new ProductsDAO();
                                  Product product = productsDAO.getProductsById(prod_id);
                                  totalPrice += product.getPrice() * qty;
                      %>
                      <tr>
                          <td>
                              <div class="media">
                                  <div class="d-flex">
                                      <img src="<%=product.getImgUrl()%>" alt="" style="width:100px;height:100px;">
                                  </div>
                                  <div class="media-body">
                                      <p><%=product.getPurductName()%></p>
                                  </div>
                              </div>
                          </td>
                          <td>
                              <h5><%=product.getPrice()%></h5>
                          </td>
                          <td>
                              <div class="product_count">
                                  <input type="text" name="qty" id="sst" maxlength="12" value="<%=qty%>" title="Quantity:"
                                         class="input-text qty">
                                  <%--
                                  <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
                                          class="increase items-count" type="button"><i class="lnr lnr-chevron-up"></i></button>
                                  <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
                                          class="reduced items-count" type="button"><i class="lnr lnr-chevron-down"></i></button>--%>
                              </div>
                          </td>
                          <td>
                              <h5><%=product.getPrice() * qty%></h5>
                          </td>
                      </tr>
                      <%
                              }
                              %>
                          <tr>
                          <td>

                          </td>
                          <td>

                          </td>
                          <td>
                              <h5>Subtotal</h5>
                          </td>
                          <td>
                              <h5>$<%=totalPrice%></h5>
                      </td>
                      </tr>
                      <tr class="shipping_area">
                          <td class="d-none d-md-block">

                          </td>
                          <td>

                          </td>
                          <td>
                              <h5>Shipping</h5>
                          </td>
                          <td>
                              <div class="shipping_box">
                                  <ul class="list">
                                      <li><a href="#">Flat Rate: $5.00</a></li>
                                      <li><a href="#">Free Shipping</a></li>
                                      <li><a href="#">Flat Rate: $10.00</a></li>
                                      <li class="active"><a href="#">Local Delivery: $2.00</a></li>
                                  </ul>
                                  <h6>Calculate Shipping <i class="fa fa-caret-down" aria-hidden="true"></i></h6>
                                  <select class="shipping_select">
                                      <option value="1">Canada</option>
                                  </select>
                                  <select class="shipping_select">
                                      <option value="1">Toronto</option>
                                      <option value="2">North York</option>
                                      <option value="4">Scarborough</option>
                                  </select>
                                  <input type="text" placeholder="Postcode/Zipcode">
                                  <a class="gray_btn" href="#">Update Details</a>
                              </div>
                          </td>
                      </tr>
                      <tr class="out_button_area">
                          <td class="d-none-l">

                          </td>
                          <td class="">

                          </td>
                          <td>

                          </td>
                          <td>
                              <div class="checkout_btn_inner d-flex align-items-center">
                                  <a class="gray_btn" href="/OnlineShopping/index.jsp">Continue Shopping</a>
                                  <a class="primary-btn ml-2" href="/OnlineShopping/checkout">Proceed to checkout</a>
                              </div>
                          </td>
                      </tr>
                                          </tbody>
                                      </table>
                                  </div>
                              </div>
                          </div>
                      </section>
                        <%
                          } else {
                              %>
                            <br/><br/>
                        <h2 type="text-align：center">Your Shopping Cart is empty.</h2>
                        <br/><br/>
                    <%
                          }
                      %>

  <!--================End Cart Area =================-->



  <!--================ Start footer Area  =================-->	
	<footer>
		<div class="footer-area footer-only">
			<div class="container">
				<div class="row section_gap">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets ">
							<h4 class="footer_title large_title">Our Mission</h4>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no 
								divided deep moved us lan Gathering thing us land years living.
							</p>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no divided deep moved 
							</p>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Quick Links</h4>
							<ul class="list">
								<li><a href="#">Home</a></li>
								<li><a href="#">Shop</a></li>
								<li><a href="#">Blog</a></li>
								<li><a href="#">Product</a></li>
								<li><a href="#">Brand</a></li>
								<li><a href="#">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget instafeed">
							<h4 class="footer_title">Gallery</h4>
							<ul class="list instafeed d-flex flex-wrap">
								<li><img src="img/gallery/r1.jpg" alt=""></li>
								<li><img src="img/gallery/r2.jpg" alt=""></li>
								<li><img src="img/gallery/r3.jpg" alt=""></li>
								<li><img src="img/gallery/r5.jpg" alt=""></li>
								<li><img src="img/gallery/r7.jpg" alt=""></li>
								<li><img src="img/gallery/r8.jpg" alt=""></li>
							</ul>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Contact Us</h4>
							<div class="ml-40">
								<p class="sm-head">
									<span class="fa fa-location-arrow"></span>
									Head Office
								</p>
								<p>123, Main Street, Your City</p>
	
								<p class="sm-head">
									<span class="fa fa-phone"></span>
									Phone Number
								</p>
								<p>
									+123 456 7890 <br>
									+123 456 7890
								</p>
	
								<p class="sm-head">
									<span class="fa fa-envelope"></span>
									Email
								</p>
								<p>
									free@infoexample.com <br>
									www.infoexample.com
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="container">
				<div class="row d-flex">
					<p class="col-lg-12 footer-text text-center">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
				</div>
			</div>
		</div>
	</footer>
	<!--================ End footer Area  =================-->



  <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="vendors/skrollr.min.js"></script>
  <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="vendors/jquery.ajaxchimp.min.js"></script>
  <script src="vendors/mail-script.js"></script>
  <script src="js/main.js"></script>
</body>
</html>