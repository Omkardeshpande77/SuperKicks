//alert("Testing");
function add_to_cart(pid,pname,price){
    let cart=localStorage.getItem("cart");
    if(cart == null){
        let products = [];
        let product ={productId:pid,productName:pname,productQuantity:1,productPrice:price}
        products.push(product);
        localStorage.setItem("cart",JSON.stringify(products));
        console.log("Product is added for the cart first time");
    }
    else{
        let pcart=JSON.parse(cart);
        let oldProduct=pcart.find((item)=> item.productId==pid);
        
        if(oldProduct){
            oldProduct.productQuantity=oldProduct.productQuantity+1
            
            pcart.map((item)=>{
                if (item.productId==oldProduct.productId) {
                    item.productQuantity=oldProduct.productQuantity;
                }
            })
             localStorage.setItem("cart",JSON.stringify(pcart));
             console.log("Product Quantity Increased");
        }else {
            let product ={productId:pid,productName:pname,productQuantity:1,productPrice:price}
            pcart.push(product)
            localStorage.setItem("cart",JSON.stringify(pcart));
            console.log("Product is Added");
        }

        
    }
}
 $(document).ready(function (){
            updateCart()
    })

//update CArt
function updateCart(){
    let cartString=localStorage.getItem("cart");
    let cart=JSON.parse(cartString);
    if (cart==null || cart.length==0) {
        console.log("Cart is Empty")
        $(".cart-items").html("Cart(0)");
        $(".cart-body").html("<h3>Your Cart is Empty :(</h3>");
        $(".btn-cart").addClass('disabled');
    }
    else{
         $(".cart-items").html(`Cart(${cart.length})`);
         
         let table =`
 
                    <table class="table">
  <thead>
    <tr>
      <th >Item Name</th>
      <th >Item Price</th>
      <th>Item Quantity</th>
      <th>Total Product Price</th>
      <th>Action</th>
    </tr>
  </thead>
        

`;
        let totalprice=0;
 cart.map((item)=>{
     
     table+=`
     <tr>
      <td>${item.productName}</td>
      <td>₹${item.productPrice}</td>
      <td>${item.productQuantity}</td>
      <td>₹${item.productQuantity*item.productPrice}</td>
      <td><button onclick='deleteItemFromCart(${item.productId})'   class="btn btn-outline-danger">Remove Product</button></td>
      </tr>
            

`
     totalprice+=item.productPrice*item.productQuantity;
 })
        
        table=table+`
        
        <tr><td><h5>Total Amount:</h5> </td><td><h3 style="color:green;">₹${totalprice}</h3></td></tr>


</table>`;
         $(".cart-body").html(table);
    }
}

function deleteItemFromCart(pid){
    let cart=JSON.parse(localStorage.getItem('cart'));
    let newcart=cart.filter((item)=>item.productId != pid)
    
    localStorage.setItem('cart',JSON.stringify(newcart))
    let msg=`<div class="alert alert-warning" role="alert">
        Product Removed Form Cart
</div>`;
    $(".container").html(msg);
    updateCart();    
}

$(document).ready(function (){
    updateCart()
})

