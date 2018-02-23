/* global Vue, VueRouter, axios */

// var productTemplate = document.querySelector("#product-card");
// var productRow = document.querySelector(".row");

// // productRow.appendChild(productTemplate.content.cloneNode(true));
// // productRow.appendChild(productTemplate.content.cloneNode(true));
// // productRow.appendChild(productTemplate.content.cloneNode(true));

// axios.get("/products").then(function(response){
//   var products = response.data;
//   console.log(response.data)

//   products.forEach(function(product){
//     var productCard = productTemplate.content.cloneNode(true);
//     productCard.querySelector(".card-title").innerText = product.title;
//     productCard.querySelector(".description").innerText = product.description;
//     productCard.querySelector(".price").innerText = "$"+ product.price
//     productRow.appendChild(productCard);
//   })
// })

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};


var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var ProductsIndexPage = {
  template: "#products-index-page",
  data: function() {
    return {
      message: "All Products",
      products: []
    };
  },
  created: function() {
    axios.get("/products.json").then(function(response){
      this.products = response.data;
    }.bind(this))
  },
  methods: {},
  computed: {}
};

var LogoutPage = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var ProductsCreatePage = {
  template: "#products-create-page",
  data: function() {
    return {
      message: "Create a Product",
      title: "",
      price: "",
      image_url: "",
      description: "",
      supplier_id: "",
      errors: []
    };
  },
  created: function() {},
  methods: {
    submit: function(){
      var params = {
        title: this.title,
        price: this.price,
        image_url: this.image_url,
        description: this.description,
        supplier_id: this.supplier_id
      };
      axios.post("/products", params).then(function(response){
        router.push("/");
        // this.title = ""
        // this.price = ""
        // this.image_url = ""
        // this.description = ""
        // this.supplier_id = ""
      }).catch(function(error){
        this.errors = error.response.data.error;
      }.bind(this)
    )}
  },
  computed: {}
};

var ShoppingCart = {
  template: "#shopping-cart",
  data: function() {
    return {
      message: "Your Shopping Cart",
      carted_products: []
    };
  },
  created: function() {
    axios.get("/carted_products.json").then(function(response){
      this.carted_products = response.data;
    }.bind(this))
  },
  methods: {},
  computed: {}
};

var ProductShowPage = {
  template: "#product-show-page",
  data: function() {
    return {
      product: []
    };
  },
  created: function() {
    axios.get("/products/" + this.$route.params.id).then(function(response){
      this.product = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage},
    { path: "/login", component: LoginPage},
    { path: "/logout", component: LogoutPage},
    { path: "/products", component: ProductsIndexPage},
    { path: "/products/new", component: ProductsCreatePage},
    { path: "/cart", component: ShoppingCart},
    { path: "/products/:id", component: ProductShowPage}
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});
